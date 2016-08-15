ARGUMENTOS_ESPERADOS=2

PASTA_PROJETO=$1
COMANDO=$2
echo "configurando variaveis para $PASTA_PROJETO"
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "Especifique o nome caminho para pasta do projeto $0 ;) "
  exit $E_BADARGS
fi
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
echo "Executando $COMANDO em $PASTA_PROJETO"
#ATENÇÃO VARIAVEL DUPLICADA EM SB_VARIAVEIS
declare -a PASTAS_MODULO=("modelRegras" "webApp" "Android" "ws" "ic")
declare -a CAMINHOS_TODOS_PROJETOS=($PASTA_PROJETO)
declare -a CAMINHOS_TUDO=("/home" "/home/superBits")
declare -a CAMINHOS_FRAMEWORK=("/home" "$caminhoSBFW")
declare -a CAMINHOS_MODEL=("modelRegra")
#Criando array com camihos para execução e adicionando a pasta do projeto
declare -a CAMINHOS_EXECUCAO=()

if [[ "$COMANDO" == compila* ]] 
then
declare -a SCRIPTS_COM_ACOES=("compilar.sh")
fi

if [[ "$COMANDO" ==  sincroniza* ]] 
then
declare -a SCRIPTS_COM_ACOES=("sincronizar.sh")
fi

if [[ "$COMANDO" == baixar* ]] 
then
declare -a SCRIPTS_COM_ACOES=("baixar.sh")
fi

if [[ "$COMANDO" == enviar* ]] 
then
declare -a SCRIPTS_COM_ACOES=("enviar.sh")
fi

if [[ "$COMANDO" == executar* ]] 
then
declare -a SCRIPTS_COM_ACOES=("executar.sh")
fi

if [[ "$COMANDO" == implantar* ]] 
then
declare -a SCRIPTS_COM_ACOES=("testeConformidade.sh" "implantar.sh")
fi

if [[ "$COMANDO" == testar* ]] 
then
declare -a SCRIPTS_COM_ACOES=("testeConformidade.sh")
fi



#Adiciona os caminhos e seus respectivos Scripts que devem ser executados
if [[ "$COMANDO" == *Tudo.sh ]] 
then
for idx in "${!CAMINHOS_TUDO[@]}"; do
    CAMINHOS_EXECUCAO+=(${CAMINHOS_TUDO[$idx]})
done
fi


#Adiciona os caminhos e seus respectivos Scripts que devem ser executados
if [[ "$COMANDO" == *TodosProjetos.sh ]] 
then
for idx in "${!CAMINHOS_TODOS_PROJETOS[@]}"; do
    CAMINHOS_EXECUCAO+=(${CAMINHOS_TUDO[$idx]})
done
fi


#Adiciona os caminhos e seus respectivos Scripts que devem ser executados
if [[ "$COMANDO" == *Model.sh ]] 
then
for idx in "${!CAMINHOS_TODOS_PROJETOS[@]}"; do
    CAMINHOS_EXECUCAO+=(${CAMINHOS_MODEL[$idx]})
done
fi



#Adiciona os caminhos e seus respectivos Scripts que devem ser executados
if [[ "$COMANDO" == *FrameWork.sh ]] 
then
for idx in "${!CAMINHOS_FRAMEWORK[@]}"; do
    CAMINHOS_EXECUCAO+=(${CAMINHOS_FRAMEWORK[$idx]})
done
fi


# ADICIONANDO A PASTA DO PROJETO (É UTULIZADA EM TODOS)
 CAMINHOS_EXECUCAO+=($PASTA_PROJETO)






