

ARGUMENTOS_ESPERADOS=2
NOME_PASTA_REPOSITORIO_SERVIDOR=$1.git
NOME_PROJETO=$1
prATUALIZAR_REQUISITO=$2


RESTORE='\033[0m'
function alerta() {
    mensagem="$1"
    echo -e -n "\033[1;36m$mensagem"   
    echo -en "${RESTORE}"
    echo " "
}


alerta "nome pasta Projeto====$NOME_PASTA_REPOSITORIO_SERVIDOR"
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  alerta "O parametro nome do projeto não foi enviado $0 ;) "
  exit $E_BADARGS
fi

#Verificando se relase do projeto existe
ATUALIZAR_REQUISITO=false
if [[ $prATUALIZAR_REQUISITO == *"SIM"* ]]
then
ATUALIZAR_REQUISITO=true
fi


alerta "Verificando existencia do repositório no servidor ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR" 
CAMINHO_PASTA_SERVIDOR=~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
if [ ! -d "$CAMINHO_PASTA_SERVIDOR" ]
then
  alerta "O repositorio Relase do projeto não foi encontrado EM ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR  $0  "
  exit $E_BADARGS
fi



alerta "criando repositório em ~/publicados via gitClone "
cd ~/publicados
git clone ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR


cd ~/publicados/$NOME_PROJETO
alerta "Adicionando alterações do projeto no servidor "
alerta "git add all "
git add --all 
alerta "git commit "
git commit -m "BKP versão remota"
alerta "git push "
git push

alerta "Realizando backup do banco (Falta implementar)"
