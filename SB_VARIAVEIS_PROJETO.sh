

CAMINHO_CLIENTE_SOURCE=$caminhoProjetos/$cliente/source
CAMINHO_CLIENTE_RELEASE=$caminhoProjetos/$cliente/release

CAMINHO_PROJETO_SOURCE=$CAMINHO_CLIENTE_SOURCE/$projeto
CAMINHO_PROJETO_RELEASE=$CAMINHO_CLIENTE_RELEASE/$projeto


ARQ_CLIENTE_RELEASE="$CAMINHO_CLIENTE_RELEASE/cliente.info"
ARQ_CLIENTE_SOURCE="$CAMINHO_CLIENTE_SOURCE/cliente.info"
if [ ! -f "$ARQ_CLIENTE_SOURCE" ]; then
  # PASTA DO CLIENTE NÃO EXISTE
echo "O arquivo inf do cliente ($ARQ_CLIENTE_SOURCE)não existe, você precisa INFORMAR O ENDEREÇO DO SERVIDOR GIT"
echo "O sistema entende que o nome do projeto será o nome do repositório no git"
echo "portanto o endereço NÃO deve constar o CAMINHO COMPLETO  ;)"
read caminhoJiraSource
echo "Informe também o caminho das versões Release"
read caminhoJiraRelease
echo "O sistema irá criar os seguintes diretórios e arquivos: "
echo "$ARQ_CLIENTE_SOURCE"
echo "$ARQ_CLIENTE_RELEASE"
pause
mkdir $CAMINHO_CLIENTE_SOURCE -p
mkdir $CAMINHO_CLIENTE_RELEASE -p
echo "SERVIDOR_GIT_SOURCE=$caminhoJiraSource" > "$ARQ_CLIENTE_SOURCE"
echo "SERVIDOR_GIT_RELEASE=$caminhoJiraRelease" > "$ARQ_CLIENTE_RELEASE"
fi

source $caminhoProjetos/$cliente/source/cliente.info
source $caminhoProjetos/$cliente/release/cliente.info

PROJETO_GIT_SOURCE=$SERVIDOR_GIT_SOURCE/$projeto
