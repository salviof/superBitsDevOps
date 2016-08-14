ARGUMENTOS_ESPERADOS=1

PASTA_PROJETO=$1
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome caminho para pasta do projeto $0 ;) "
  exit $E_BADARGS
fi

#ATENÇÃO VARIAVEL DUPLICADA EM SB_VARIAVEIS
declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")
declare -a CAMINHOS_TODOS_PROJETOS=($PASTA_PROJETO)
declare -a CAMINHOS_TUDO=()
declare -a CAMINHOS_MODEL=()
declare -a CAMINHOS_FRAMEWORK=()

