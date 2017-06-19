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

# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#

#carregando váriaveis básicas 
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
#carregando variaveis do projeto
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS_PROJETO.sh

alerta "cliente = $cliente projeto = $projeto"
alerta "repositorio Source= $SERVIDOR_GIT_SOURCE"

alerta "caminho projeto $CAMINHO_PROJETO_SOURCE"
alerta "caminho pasta source do Cliente $CAMINHO_CLIENTE_SOURCE"
alerta "caminho pasta release do Cliente $CAMINHO_CLIENTE_RELEASE"

mkdir  $CAMINHO_CLIENTE_SOURCE -p
mkdir $CAMINHO_CLIENTE_RELEASE -p

alerta "Criando repositorio Release em $CAMINHO_PROJETO_RELEASE" 
cd $CAMINHO_CLIENTE_RELEASE
alerta "Clonando repositorio: $PROJETO_GIT_RELEASE"
git clone $PROJETO_GIT_RELEASE


cd $CAMINHO_CLIENTE_SOURCE
git clone $PROJETO_GIT_SOURCE


if [ -d "$CAMINHO_PROJETO_SOURCE" ]
then

cd $CAMINHO_PROJETO_SOURCE
echo "Executando ações posteriores em :"
echo "$CAMINHO_PROJETO_SOURCE"


for pastaModulo in "${PASTAS_MODULO[@]}"
do
echo "criando atalho para $pastaModulo  "
	mkdir  $CAMINHO_PROJETO_SOURCE/$pastaModulo -p
   /home/superBits/superBitsDevOps/devOpsProjeto/criarComandosRaiz.sh "$CAMINHO_PROJETO_SOURCE/$pastaModulo"
done
alerta "Executando ações posteriores em :"
echo "$CAMINHO_PROJETO_RELEASE"

cd $CAMINHO_PROJETO_RELEASE


fi
alerta "Fim"
pausar

