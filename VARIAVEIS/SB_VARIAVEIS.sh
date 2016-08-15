function pause(){
   read -p "$*"
}

declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")

urlRepositorioSBFW="https://github.com/salviof/SuperBits_FrameWork"
caminhoHome="/home/superBits"
caminhoSBFW="$caminhoHome/projetos/Super_Bits/source/SuperBits_FrameWork"
caminhoProjetos="$caminhoHome/projetos"
caminhoSourceSB="$caminhoProjetos/Super_Bits/source"
caminhoSourceFJ="$caminhoProjetos/FaculdadeJava/source"
caminhoReleaseSB="$caminhoProjetos/Super_Bits/release"
caminhoReleaseFJ="$caminhoProjetos/FaculdadeJava/release"
PASTA_TRABALHO_USUARIO="/home/superBits/$USER"
ARQUIVO_TRABALHO_USUARIO="$PASTA_TRABALHO_USUARIO/trabalhoAtual.info"


