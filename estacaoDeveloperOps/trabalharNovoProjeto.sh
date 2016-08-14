#!/bin/bash
ARGUMENTOS_ESPERADOS=2

cliente=$1
projeto=$2

# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome do cliente, e do projeto $0 ;) "
  exit $E_BADARGS
fi
#carregando váriaveis básicas 
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
#carregando variaveis do projeto
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS_PROJETO.sh

echo "cliente = $cliente projeto = $projeto"
echo "repositorio Source= $SERVIDOR_GIT_SOURCE"

echo "caminho projeto $CAMINHO_PROJETO_SOURCE"
echo "caminho pasta source do Cliente $CAMINHO_CLIENTE_SOURCE"
echo "caminho pasta release do Cliente $CAMINHO_CLIENTE_RELEASE"
mkdir  $CAMINHO_CLIENTE_SOURCE -p
mkdir $CAMINHO_CLIENTE_RELEASE -p


cd $CAMINHO_CLIENTE_SOURCE
git clone $PROJETO_GIT_SOURCE
cd $CAMINHO_PROJETO_SOURCE
echo "Executando ações posteriores em :"
echo "$CAMINHO_PROJETO_SOURCE"


for pastaModulo in "${PASTAS_MODULO[@]}"
do
echo "criando atalho para $pastaModulo  "
   ./devOpsProjeto/criarComandosRaiz.sh "$CAMINHO_PROJETO_SOURCE/$pastaModulo"   
done
echo "Executando ações posteriores em :"
echo "$CAMINHO_PROJETO_RELEASE"

cd $CAMINHO_PROJETO_RELEASE
for pastaModulo in "${PASTAS_MODULO[@]}"
do
   /home/superBits/superBitsDevOps/devOpsProjeto/criarComandosRaiz.sh "$CAMINHO_PROJETO_SOURCE/$pastaModulo"
done

