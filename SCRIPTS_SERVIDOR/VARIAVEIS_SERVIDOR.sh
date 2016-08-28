ARGUMENTOS_ESPERADOS=1
# Verificando se o o Cliente e o Projeto foram enviados
PST_PROJETO=$1
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome do projeto $0 ;) "
echo "Este script utiliza caminho relativo a base do projeto, você precisa chama-lo atravez da base.. $0 ;) "
  exit $E_BADARGS
fi


CAMINHO_SERVIDOR_REPOSITORIOS_RELEASE=/home/git/gitServer/release
CAMINHO_SERVIDOR_REPOSITORIOS_SOURCE=/home/git/gitServer/source
mkdir $CAMINHO_SERVIDOR_REPOSITORIOS_RELEASE -p
mkdir $CAMINHO_SERVIDOR_REPOSITORIOS_SOURCE -p

CAMINHO_REPOSITORIO_PROJETO_RELEASE=$CAMINHO_SERVIDOR_REPOSITORIOS_RELEASE/$PST_PROJETO.git
CAMINHO_REPOSITORIO_PROJETO_SOURCE=$CAMINHO_SERVIDOR_REPOSITORIOS_SOURCE/$PST_PROJETO.git

PASTA_PUBLICACAO=/home/git/publicados


echo "ENTROU VARIAVEIS SERVIDOR"
echo $PASTA_SERVIDOR_REPOSITORIOS
echo "PST:: $PST_PROJETO"

