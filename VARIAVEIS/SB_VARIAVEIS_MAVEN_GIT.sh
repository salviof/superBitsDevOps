ARGUMENTOS_ESPERADOS=1

PASTA_PROJETO=$1
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome caminho para pasta do projeto $0 ;) "
  exit $E_BADARGS
fi

#ATENÇÃO VARIAVEL DUPLICADA EM SB_VARIAVEIS
declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")
declare -a CAMINHOS_TODOS_PROJETOS=($PASTA_PROJETO)
declare -a CAMINHOS_TUDO=("CAMINHO TESTE1" "CAMINHOTESTE2" "CAMNHO TESTE3" "CAMINHO TESTE4")
declare -a CAMINHOS_MODEL=()
declare -a CAMINHOS_FRAMEWORK=()


if [[ "$PASTA_PROJETO" == *TESTE ]]
then
CAMINHOS_FRAMEWORK+=("${!CAMINHOS_TUDO[@]}")
fi
