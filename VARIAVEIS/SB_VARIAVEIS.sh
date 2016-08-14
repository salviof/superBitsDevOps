function pause(){
   read -p "$*"
}

declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")

echo "Os modulos Oficiais do Framework São:"
for pastaModulo in "${PASTAS_MODULO[@]}"
do
   echo "$pastaModulo"   
done


urlRepositorioSBFW="https://github.com/salviof/SuperBits_FrameWork"
caminhoHome="/home/superBits"
caminhoSBFW="$camihoHome/projetos/Super_Bits/source/SuperBits_FrameWork"
caminhoProjetos="$caminhoHome/projetos"
caminhoSourceSB="$caminhoProjetos/Super_Bits/source"
caminhoSourceFJ="$caminhoProjetos/FaculdadeJava/source"
caminhoReleaseSB="$caminhoProjetos/Super_Bits/release"
caminhoReleaseFJ="$caminhoProjetos/FaculdadeJava/release"
$PASTA_TRABALHO_USUARIO="/home/superBits/$user"
$ARQUIVO_TRABALHO_USUARIO="$PASTA_TRABALHO_USUARIO/trabalhoAtual.info"


