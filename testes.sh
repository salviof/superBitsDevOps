
TESTE="TESsTEeGGGggeeG"

case "$TESTE" in
 TEdS*) echo "aqui também";;
 *GGGG) echo "ENCONTROU";;
 *) echo "default";;	
esac

# LISTANDO ARQUIVOS WAR NA PASTA TARGET E ARMAZENANDO EM VARIAVEL
cd /home/superBits/projetos/vip/source/superkompras/webApp/target
i=0
while read line
do
    webappfile[ $i ]="$line"        
    (( i++ ))
done < <(ls *.war )
echo ${webappfile[0]}
ARQUIVO_WEBAAP="${webappfile[0]}"
# LISTANDO ARQUIVOS JAR NA PASTA TARGET E ARMAZENANDO EM VARIAVEL
cd /home/superBits/projetos/vip/source/superkompras/modelRegras/target
y=0
while read arqlistado
do
    modelfile[ $y ]="$arqlistado"        
    (( y++ ))
done < <(ls *.jar )
ARQUIVO_MODEL=${modelfile[0]}
#COPIANDO PARA PASTA DE IMPLANTAÇÃO
