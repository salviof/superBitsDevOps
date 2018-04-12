function pause(){
   read -p "$*"
}

declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")

urlRepositorioSBFW="https://github.com/salviof/SuperBits_FrameWork"
caminhoHome="/home/superBits"
CAMINHO_HOME=$caminhoHome
caminhoSBFW="$caminhoHome/projetos/Super_Bits/source/SuperBits_FrameWork"
CAMINHO_SBFW=$caminhoSBFW
caminhoProjetos="$caminhoHome/projetos"
CAMINHO_PROJETOS=$caminhoProjetos
caminhoSourceSB="$caminhoProjetos/Super_Bits/source"
CAMINHO_SOURCE_SB=$caminhoSourceSB
caminhoSourceFJ="$caminhoProjetos/FaculdadeJava/source"
caminhoReleaseSB="$caminhoProjetos/Super_Bits/release"
caminhoReleaseFJ="$caminhoProjetos/FaculdadeJava/release"
PASTA_TRABALHO_USUARIO="/home/superBits/$USER"
ARQUIVO_TRABALHO_USUARIO="$PASTA_TRABALHO_USUARIO/trabalhoAtual.info"

alerta1 "VARIAVEIS DE AMBIENTE DO SISTEMA"
alerta1 "Variavel CAMINHO_HOME=$caminhoHome"
alerta1 "variavel CAMINHO_SBFW=$CAMINHO_SBFW"
alerta1 "variaval CAMINHO_SOURCE_SB=$CAMINHO_SOURCE_SB"
alerta1 "variavel PASTA_TRABALHO_USUARIO=$PASTA_TRABALHO_USUARIO"
alerta1 "variavel ARQUIVO_TRABALHO_USUARIO=$ARQUIVO_TRABALHO_USUARIO"




