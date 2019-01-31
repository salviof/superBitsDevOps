

CAMINHO_CLIENTE_SOURCE=$caminhoProjetos/$cliente/source
CAMINHO_CLIENTE_RELEASE=$caminhoProjetos/$cliente/release

CAMINHO_PROJETO_SOURCE=$CAMINHO_CLIENTE_SOURCE/$projeto
CAMINHO_PROJETO_RELEASE=$CAMINHO_CLIENTE_RELEASE/$projeto

CAMINHO_MODEL_TARGET=$CAMINHO_CLIENTE_SOURCE/modelRegras/target
CAMINHO_WEBAPP_TARGET=$CAMINHO_CLIENTE_SOURCE/webApp/target

ARQ_CLIENTE_RELEASE="$CAMINHO_CLIENTE_RELEASE/cliente.info"
ARQ_CLIENTE_SOURCE="$CAMINHO_CLIENTE_SOURCE/cliente.info"
if [ ! -f "$ARQ_CLIENTE_SOURCE" ]; then
  # PASTA DO CLIENTE NÃO EXISTE
echo "O arquivo inf do cliente ($ARQ_CLIENTE_SOURCE)não existe, você precisa "
echo  "Informar algumas informações importantes para configuração:"
echo "como Caminho do repositorio de codigo fonte"
echo "caminho do repositorio para o servidor de homologação "
echo "endereço DNS do site para homologaca"
pause

echo "O sistema entende que o nome do projeto será o nome do caminho final do repositório no git"
echo "portanto o endereço NÃO deve constar o CAMINHO COMPLETO "
echo "Qual é o endereço do servidor git? Ex: ssh://git@caminhoParaHomologacao/~/projetos/"
read caminhoJiraSource
echo "Informe também o caminho das versões Release"
read caminhoJiraRelease
echo "O sistema irá criar os seguintes diretórios e arquivos: "
echo "Ok, falta informar apenas o endereço de homologação, ex: homologacao.siteDoProjeto.com.br"
read servidorHomologacao
echo "$ARQ_CLIENTE_SOURCE"
echo "$ARQ_CLIENTE_RELEASE"
pause
mkdir $CAMINHO_CLIENTE_SOURCE -p
mkdir $CAMINHO_CLIENTE_RELEASE -p
echo "SERVIDOR_GIT_SOURCE=$caminhoJiraSource" > "$ARQ_CLIENTE_SOURCE"
echo "SERVIDOR_GIT_RELEASE=$caminhoJiraRelease" > "$ARQ_CLIENTE_RELEASE"
echo "SERVIDOR_HOMOLOGACAO=$servidorHomologacao" >> "$ARQ_CLIENTE_RELEASE"
fi

source $caminhoProjetos/$cliente/source/cliente.info
source $caminhoProjetos/$cliente/release/cliente.info

PROJETO_GIT_SOURCE=$SERVIDOR_GIT_SOURCE/$projeto
PROJETO_GIT_RELEASE=$SERVIDOR_GIT_RELEASE/$projeto




alerta2 "carregando variaveis do projeto,isto está  depreciado????"
alertaMuitoImportante "DEPRECIADO?????????????"



