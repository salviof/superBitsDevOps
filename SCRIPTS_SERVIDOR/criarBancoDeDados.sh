

ARGUMENTOS_ESPERADOS=1
NOME_PASTA_REPOSITORIO_SERVIDOR=$1.git
NOME_PROJETO=$1


echo "nome pasta Projeto====$NOME_PASTA_REPOSITORIO_SERVIDOR"
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "O parametro nome do projeto não foi enviado $0 ;) "
  exit $E_BADARGS
fi
#Verificando se relase do projeto existe
CAMINHO_PASTA_SERVIDOR=~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
if [ ! -d "$CAMINHO_PASTA_SERVIDOR" ]
then
  echo "O repositorio Relase do projeto não foi encontrado EM ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR  $0  "
  exit $E_BADARGS
fi
cd ~/publicados
git clone ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
cd ~/publicados/$NOME_PROJETO
git pull

#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
# (OLD)para compatibilidade
source ~/publicados/$NOME_PROJETO/cliente.info
#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
#NOVO
source ~/publicados/$NOME_PROJETO/SBProjeto.prop
NOME_PROJETO=$1

echo "Apagando $NOME_BANCO"

echo " Atualizando  $ENDERECO_WEB_REQUISITO"
echo " e  $SERVIDOR_REQUISITOS"


mysqladmin -u root drop $NOME_BANCO -f
echo "criando $NOME_BANCO"
mysqladmin -u root create $NOME_BANCO -f

mysql -u root  $NOME_BANCO < ./bancoHomologacao.sql

