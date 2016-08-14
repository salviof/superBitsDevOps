ok() 
{ echo -e '\e[32m'$1'\e[m'; } 

ARGUMENTOS_ESPERADOS=2

cliente=$1
projeto=$2

# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome do cliente, e do projeto $0 "
  exit $E_BADARGS
fi
#carregando váriaveis básicas 
source /home/superBits/superBitsDevOps/SB_VARIAVEIS.sh
#carregando variaveis do projeto
source /home/superBits/superBitsDevOps/SB_VARIAVEIS_PROJETO.sh

echo "cliente = $cliente projeto = $projeto"
echo "repositorio Source= $SERVIDOR_GIT_SOURCE"

echo "caminho projeto $CAMINHO_PROJETO_SOURCE"
echo "caminho pasta source do Cliente $CAMINHO_CLIENTE_SOURCE"
echo "caminho pasta release do Cliente $CAMINHO_CLIENTE_RELEASE"
mkdir  $CAMINHO_CLIENTE_SOURCE -p
mkdir $CAMINHO_CLIENTE_RELEASE -p
cd $CAMINHO_CLIENTE_SOURCE
git clone $PROJETO_GIT_SOURCE
