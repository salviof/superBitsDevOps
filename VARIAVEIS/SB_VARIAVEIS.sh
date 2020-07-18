function pause(){
   read -p "$*"
}

declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")


#TODO BUSCAR CAMINHO HOME EM PATH DA AREA DE TRABALHO,e OU MUDAR PATH PADRÃO PARA .~/FWColetivoJava.com.br


urlRepositorioSBFW="https://github.com/salviof/SuperBits_FrameWork" #DEPRECIADO
caminhoHome="/home/superBits"
CAMINHO_HOME=$caminhoHome
caminhoSBFW="$caminhoHome/projetos/coletivoJava/source/fw/FWColetivoJava"
CAMINHO_SBFW=$caminhoSBFW
caminhoProjetos="$caminhoHome/projetos"
CAMINHO_PROJETOS=$caminhoProjetos
caminhoSourceSB="$caminhoProjetos/Super_Bits/source"
CAMINHO_SOURCE_SB=$caminhoSourceSB
CAMINHO_SOURCE_COLETIVO=$caminhoProjetos/coletivoJava/source
#caminhoSourceFJ="$caminhoProjetos/FaculdadeJava/source"
caminhoReleaseSB="$caminhoProjetos/Super_Bits/release"
#caminhoReleaseFJ="$caminhoProjetos/FaculdadeJava/release"
PASTA_TRABALHO_USUARIO="/home/superBits/$USER"
ARQUIVO_TRABALHO_USUARIO="$PASTA_TRABALHO_USUARIO/trabalhoAtual.info"



alerta2 "VARIAVEIS DE AMBIENTE DO COLETIVO JAVA"
alerta2 "CAMINHO_HOME=$caminhoHome"
alerta2 "CAMINHO_SOURCE_COLETIVO=$CAMINHO_SOURCE_COLETIVO"
alerta2 "PASTA_TRABALHO_USUARIO=$PASTA_TRABALHO_USUARIO"
alerta2 "ARQUIVO_TRABALHO_USUARIO=$ARQUIVO_TRABALHO_USUARIO"
alerta "Em caso de execução por docker, você pode mapear um volome para pasta home: $caminhoHome  no diretório da sua preferência"

source $CAMINHO_HOME/superBitsDevOps/VARIAVEIS/SB_MODULOS_OFICIAIS.sh




