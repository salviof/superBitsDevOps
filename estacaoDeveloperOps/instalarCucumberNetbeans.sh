#!/usr/bin/env bash
#
# instalar-cucumber-netbeans.sh
#
# Baixa o código do plugin "Cucumber Features" (fork Chris2011), adapta para o
# Apache NetBeans 24, compila com as ferramentas que já vêm dentro do próprio
# NetBeans (Ant + harness) e instala no seu userdir.
#
# Requisitos: só o NetBeans instalado (e o JDK que ele já usa para rodar).
# Ferramentas usadas: bash, curl, e o "jar" do JDK para descompactar.
#
# Uso:
#   ./instalar-cucumber-netbeans.sh
#
# Variáveis opcionais (só se a detecção automática falhar):
#   NB_HOME=/opt/netbeans        pasta de instalação do NetBeans
#   NB_USERDIR=~/.local/share/NetBeans/24
#   NB_VERSION=24
#   JDK_HOME=/usr/lib64/jvm/java-21-openjdk
#
set -euo pipefail

PASTA="/home/superBits/desenvolvedor/netbeansPlugin/cucumber"
REPO_ZIP="https://codeload.github.com/Chris2011/cucumber-netbeans-plugin/zip/refs/heads/master"
NB_VERSION="${NB_VERSION:-24}"

die()  { echo "ERRO: $*" >&2; exit 1; }
info() { echo "==> $*"; }

# --- 1. NetBeans precisa estar fechado ----------------------------------------
# Ao fechar, a IDE grava o estado dos módulos e desfaria a instalação.
if pgrep -f "org.netbeans.Main" >/dev/null 2>&1; then
    die "feche o NetBeans antes de rodar este script"
fi

# --- 2. Achar a instalação do NetBeans -----------------------------------------
# Uma instalação válida tem o harness (sistema de build de plugins) e o Ant embutido.
nb_valido() { [[ -f "$1/harness/build.xml" && -x "$1/extide/ant/bin/ant" ]]; }

if [[ -z "${NB_HOME:-}" ]]; then
    CANDIDATOS=()
    # Se o comando "netbeans" está no PATH, ele fica em <NB_HOME>/bin/netbeans.
    if command -v netbeans >/dev/null 2>&1; then
        CANDIDATOS+=("$(dirname "$(dirname "$(readlink -f "$(command -v netbeans)")")")")
    fi
    for base in /opt /usr/local /usr/lib /usr/lib64 /usr/share "$HOME" "$HOME/Programas" "$HOME/apps" /snap/netbeans/current; do
        for d in "$base"/netbeans* "$base"/apache-netbeans* "$base"/NetBeans* "$base"/netbeans*/netbeans "$base"/netbeans; do
            [[ -d "$d" ]] && CANDIDATOS+=("$d")
        done
    done
    for d in "${CANDIDATOS[@]}"; do
        if nb_valido "$d"; then NB_HOME="$d"; break; fi
    done
fi
[[ -n "${NB_HOME:-}" ]] && nb_valido "$NB_HOME" \
    || die "instalação do NetBeans não encontrada; rode com NB_HOME=/caminho/do/netbeans"
info "NetBeans: $NB_HOME"

# --- 3. Achar um JDK 17+ (precisa do javac, não só do java) --------------------
# O NetBeans 24 roda em JDK 17+ e o harness precisa de um JDK assim para
# compilar. Se você tem vários JDKs (ex.: 8 para os seus projetos), o script
# ignora os antigos e escolhe o primeiro 17+ que encontrar.
# Ordem: JDK_HOME, netbeans_jdkhome do netbeans.conf, JAVA_HOME, javac do PATH,
# e por fim os JDKs instalados em /usr/lib64/jvm e /usr/lib/jvm.
versao_jdk() {
    # "javac 1.8.0_402" -> 8   |   "javac 21.0.2" -> 21
    local v
    v="$("$1/bin/javac" -version 2>&1 | grep -m1 '^javac ' | cut -d' ' -f2)"
    v="${v#1.}"
    echo "${v%%[.+_-]*}"
}

CANDIDATOS_JDK=()
[[ -n "${JDK_HOME:-}" ]] && CANDIDATOS_JDK+=("$JDK_HOME")
CONF_JDK="$(grep -E '^[[:space:]]*netbeans_jdkhome=' "$NB_HOME/etc/netbeans.conf" 2>/dev/null \
            | tail -1 | cut -d= -f2- | tr -d '"' || true)"
[[ -n "$CONF_JDK" ]]          && CANDIDATOS_JDK+=("$CONF_JDK")
[[ -n "${JAVA_HOME:-}" ]]     && CANDIDATOS_JDK+=("$JAVA_HOME")
command -v javac >/dev/null 2>&1 \
    && CANDIDATOS_JDK+=("$(dirname "$(dirname "$(readlink -f "$(command -v javac)")")")")
for d in /usr/lib64/jvm/* /usr/lib/jvm/*; do [[ -d "$d" ]] && CANDIDATOS_JDK+=("$d"); done

JDK_HOME=""
for d in "${CANDIDATOS_JDK[@]}"; do
    [[ -x "$d/bin/javac" && -x "$d/bin/jar" ]] || continue
    v="$(versao_jdk "$d")"
    if [[ "$v" =~ ^[0-9]+$ ]] && (( v >= 17 )); then JDK_HOME="$d"; break; fi
done
[[ -n "$JDK_HOME" ]] \
    || die "nenhum JDK 17+ encontrado; instale um (sudo zypper install java-21-openjdk-devel) ou use JDK_HOME=/caminho"
info "JDK: $JDK_HOME (versão $(versao_jdk "$JDK_HOME"))"

# --- 4. Achar o userdir (onde ficam seus plugins e configurações) --------------
if [[ -z "${NB_USERDIR:-}" ]]; then
    if   [[ -d "$HOME/.local/share/NetBeans/$NB_VERSION" ]]; then NB_USERDIR="$HOME/.local/share/NetBeans/$NB_VERSION"
    elif [[ -d "$HOME/.netbeans/$NB_VERSION" ]];             then NB_USERDIR="$HOME/.netbeans/$NB_VERSION"
    else die "userdir do NetBeans $NB_VERSION não encontrado; abra o NetBeans uma vez ou use NB_USERDIR"
    fi
fi
info "userdir: $NB_USERDIR"

# --- 5. Baixar e descompactar o código-fonte -----------------------------------
mkdir -p "$PASTA"
ZIP="$PASTA/cucumber-netbeans-plugin.zip"
FONTE="$PASTA/fonte"

info "baixando o repositório para $ZIP"
curl -fL --retry 2 -o "$ZIP" "$REPO_ZIP" || die "falha no download do GitHub"

# O "jar" do JDK descompacta ZIP; assim não dependemos do unzip.
rm -rf "$FONTE" "$PASTA/extraido"
mkdir -p "$PASTA/extraido"
( cd "$PASTA/extraido" && "$JDK_HOME/bin/jar" xf "$ZIP" )
mv "$PASTA"/extraido/cucumber-netbeans-plugin-* "$FONTE"
rmdir "$PASTA/extraido"
info "código em $FONTE"

# --- 6. Adaptar o projeto (de 2010) ao NetBeans 24 -----------------------------
cd "$FONTE"

# 6a. Apontar o build para a SUA instalação do NetBeans.
cat > nbproject/platform.properties <<'EOF'
nbplatform.active=default
cluster.path=\
    ${nbplatform.active.dir}/platform:\
    ${nbplatform.active.dir}/ide:\
    ${nbplatform.active.dir}/harness
EOF
mkdir -p nbproject/private
cat > nbproject/private/platform-private.properties <<EOF
nbplatform.default.netbeans.dest.dir=$NB_HOME
nbplatform.default.harness.dir=$NB_HOME/harness
EOF

# 6b. Os JARs do NetBeans 24 são compilados para Java 11 (class file 55),
#     então o plugin precisa ser compilado como Java 11 para conseguir lê-los.
#     E remove a assinatura do .nbm (o keystore do autor não está no repositório).
sed -i -e 's/^javac\.source=.*/javac.source=11/' \
       -e '/^javac\.target=/d' \
       -e '/^keystore=/d' -e '/^nbm_alias=/d' nbproject/project.properties
echo 'javac.target=11' >> nbproject/project.properties

# 6c. Dependências: remove dois módulos que não existem mais no NetBeans 24
#     (o código nem os usa) e adiciona org.openide.util.ui, para onde
#     ImageUtilities e HelpCtx foram movidos.
awk '
    /<dependency>/ { buf = $0 "\n"; dentro = 1; next }
    dentro {
        buf = buf $0 "\n"
        if (/<\/dependency>/) {
            dentro = 0
            if (buf !~ /org\.jdesktop\.layout|org\.netbeans\.modules\.i18n</) printf "%s", buf
        }
        next
    }
    /<\/module-dependencies>/ && !feito {
        print "                <dependency>"
        print "                    <code-name-base>org.openide.util.ui</code-name-base>"
        print "                    <build-prerequisite/>"
        print "                    <compile-dependency/>"
        print "                    <run-dependency>"
        print "                        <specification-version>9.0</specification-version>"
        print "                    </run-dependency>"
        print "                </dependency>"
        feito = 1
    }
    { print }
' nbproject/project.xml > nbproject/project.xml.novo
mv nbproject/project.xml.novo nbproject/project.xml

# 6d. Remove o registro de um "update center" antigo do autor, que não existe
#     mais e geraria erro de conexão toda vez que a IDE procurasse atualizações.
awk '
    /<folder name=.AutoupdateType.>/ { pular = 1; next }
    pular && /<\/folder>/            { pular = 0; next }
    !pular                           { print }
' src/qubit/cucumber/editor/layer.xml > src/qubit/cucumber/editor/layer.xml.novo
mv src/qubit/cucumber/editor/layer.xml.novo src/qubit/cucumber/editor/layer.xml
info "projeto adaptado"

# --- 7. Compilar com o Ant que vem dentro do NetBeans --------------------------
# O alvo "nbm" compila, monta build/cluster e gera o arquivo .nbm.
info "compilando"
JAVA_HOME="$JDK_HOME" "$NB_HOME/extide/ant/bin/ant" -q -f build.xml clean nbm \
    || die "falha na compilação (veja as mensagens acima)"

CLUSTER="$FONTE/build/cluster"
[[ -f "$CLUSTER/config/Modules/qubit-cucumber-editor.xml" ]] \
    || die "build terminou sem gerar o módulo em $CLUSTER"
cp "$FONTE"/build/*.nbm "$PASTA/" 2>/dev/null || true

# --- 8. Instalar no userdir -----------------------------------------------------
# build/cluster já tem a mesma estrutura do userdir: modules/, config/Modules/
# e update_tracking/. Basta copiar por cima, guardando um backup antes.
BACKUP="$PASTA/backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"
cp -a "$NB_USERDIR/config/Modules" "$BACKUP/" 2>/dev/null || true
cp -a "$CLUSTER/." "$NB_USERDIR/"
info "módulo instalado (backup em $BACKUP)"

# --- 8b. Associar .feature ao tipo text/x-feature -----------------------------
# É o mesmo que Tools > Options > Miscellaneous > Files. A IDE guarda essas
# associações em config/Services/MIMEResolver/user-defined-mime-resolver.xml,
# que tem prioridade sobre os módulos (position 10). Se o arquivo já existe com
# outras associações suas, elas são mantidas; só a linha do .feature muda.
MIMEDIR="$NB_USERDIR/config/Services/MIMEResolver"
MIMEXML="$MIMEDIR/user-defined-mime-resolver.xml"
NBATTRS="$MIMEDIR/.nbattrs"
mkdir -p "$MIMEDIR"

if [[ ! -f "$MIMEXML" ]]; then
    cat > "$MIMEXML" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE MIME-resolver PUBLIC "-//NetBeans//DTD MIME Resolver 1.1//EN" "http://www.netbeans.org/dtds/mime-resolver-1_1.dtd">
<MIME-resolver>
</MIME-resolver>
EOF
fi
cp -a "$MIMEXML" "$BACKUP/" 2>/dev/null || true

# Lê cada bloco <file>...</file>: tira o .feature de onde estiver; se o bloco
# ficar sem nenhuma extensão, descarta o bloco inteiro (um bloco sem <ext>
# casaria com qualquer arquivo). No fim, acrescenta o bloco do .feature.
awk '
    /<file>/   { buf = $0 "\n"; dentro = 1; next }
    dentro {
        if ($0 ~ /<ext name="feature"\/>/) next
        buf = buf $0 "\n"
        if (/<\/file>/) { dentro = 0; if (buf ~ /<ext /) printf "%s", buf }
        next
    }
    /<\/MIME-resolver>/ {
        print "    <file>"
        print "        <ext name=\"feature\"/>"
        print "        <resolver mime=\"text/x-feature\"/>"
        print "    </file>"
    }
    { print }
' "$MIMEXML" > "$MIMEXML.novo"
mv "$MIMEXML.novo" "$MIMEXML"

# Atributos que marcam o arquivo como "associações do usuário" e dão a prioridade.
if [[ ! -f "$NBATTRS" ]]; then
    cat > "$NBATTRS" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE attributes PUBLIC "-//NetBeans//DTD DefaultAttributes 1.0//EN" "http://www.netbeans.org/dtds/attributes-1_0.dtd">
<attributes version="1.0">
</attributes>
EOF
fi
if ! grep -q 'name="user-defined-mime-resolver.xml"' "$NBATTRS"; then
    awk '
        /<\/attributes>/ {
            print "    <fileobject name=\"user-defined-mime-resolver.xml\">"
            print "        <attr name=\"position\" intvalue=\"10\"/>"
            print "        <attr name=\"user-defined-mime-resolver\" boolvalue=\"true\"/>"
            print "    </fileobject>"
        }
        { print }
    ' "$NBATTRS" > "$NBATTRS.novo"
    mv "$NBATTRS.novo" "$NBATTRS"
fi
info ".feature associado a text/x-feature"

# --- 9. Limpar o cache de módulos ------------------------------------------------
# Sem isso a IDE pode usar a lista de módulos antiga guardada em cache.
CACHE="$HOME/.cache/netbeans/$NB_VERSION"
if [[ -d "$CACHE" ]]; then rm -rf "$CACHE"; info "cache limpo"; fi

cat <<EOF

Pronto. Abra o NetBeans e abra um arquivo .feature.
As cores podem ser ajustadas em Tools > Options > Fonts & Colors > Language: Feature.

O .nbm gerado ficou em $PASTA (serve para instalar em outra máquina
pela tela Tools > Plugins > Downloaded).

Se não aparecer cor, veja o motivo no log:
  grep -i -B2 -A5 "qubit" "$NB_USERDIR/var/log/messages.log"

Para desinstalar: Tools > Plugins > Installed > "Cucumber Features" > Uninstall.
EOF

