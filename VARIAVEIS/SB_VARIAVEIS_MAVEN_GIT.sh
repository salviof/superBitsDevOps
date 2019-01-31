ARGUMENTOS_ESPERADOS=2
PASTA_PROJETO=$1
COMANDO=$2
echo "configurando variaveis para $PASTA_PROJETO"
# Verificando se a pasta e comando foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome caminho para pasta do projeto $0 ;) "
  exit 0
fi
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh

#Criando split para determinar cliente pasta release e source pasta do projeto
IFS='/' read -ra SPLIT_CAMINHO_PROJETO <<< "$PASTA_PROJETO"   
CLIENTE=${SPLIT_CAMINHO_PROJETO[4]};
NOME_PROJETO=${SPLIT_CAMINHO_PROJETO[6]}
CAMINHO_CLIENTE=/${SPLIT_CAMINHO_PROJETO[1]}/${SPLIT_CAMINHO_PROJETO[2]}/${SPLIT_CAMINHO_PROJETO[3]}/${SPLIT_CAMINHO_PROJETO[4]}

echo "${#NOME_PROJETO}"

if [ "${#NOME_PROJETO}" -le 1 ]
then 
   alerta "O nome do projeto não foi determinado"		
   exit 0;
fi

CAMINHO_CLIENTE_SOURCE=$CAMINHO_CLIENTE/source
CAMINHO_RELEASE=$CAMINHO_CLIENTE/release #Depreciado, subistituir pelo abaixo
CAMINHO_CLIENTE_RELEASE=$CAMINHO_CLIENTE/release 


alerta1 "Variavel NOME_PROJETO=[$NOME_PROJETO]"
alerta1 "Variavel CLIENTE=[$CLIENTE]"
alerta1 "Variável CAMINHO_CLIENTE_SOURCE=[$CAMINHO_CLIENTE_SOURCE]"
alerta1 "Variavel CAMINHO_CLIENTE_RELEASE = [$CAMINHO_CLIENTE_RELEASE]"
alerta1  "Variavel CAMINHO_RELEASE = [$CAMINHO_RELEASE]"
alerta1 "Variavel CAMINHO_CLIENTE =[$CAMINHO_CLIENTE] "





