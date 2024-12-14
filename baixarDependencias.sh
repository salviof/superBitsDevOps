# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
echo "Inicializando Funções bash em $SCRIPTPATH"
source $SCRIPTPATH/core/coreSBBash.sh
source $SCRIPTPATH/VARIAVEIS/SB_VARIAVEIS.sh

for PASTA_PROJETO in "${!PASTAS_COLETIVO_JAVA_FW[@]}"; do
	CAMINHO_PASTA_PROJETO=${PASTAS_COLETIVO_JAVA_FW[$PASTA_PROJETO]}
	alerta "Criando pasta $CAMINHO_PASTA_PROJETO";
       	mkdir $CAMINHO_PASTA_PROJETO -p
	arqSairSeArquivoExistir $CAMINHO_PASTA_PROJETO 'Erro criando pasta em: '+$CAMINHO_PASTA_PROJETO+' cheque as permissões'
done

atualizarProjeto(){
PASTA_PROJETOS=$1
PROJETO=$2
 	
	alerta1 "Analizando projeto "$PASTA_PROJETOS/$PROJETO
	alerta1 "Verificando existencia de: $PASTA_PROJETOS/$PROJETO/.git/config"
	if arqArquivoExiste $PASTA_PROJETOS/$PROJETO/.git/config; 
        then 
          alerta2 'Atualizando Repositorio https://github.com/salviof/'$PROJETO
	   cd $PASTA_PROJETOS/$PROJETO
	   git pull
        else 
	  cd $PASTA_PROJETOS
	   alerta2 'Clonando Repositorio https://github.com/salviof/'$PROJETO
	   git clone https://github.com/salviof/$PROJETO
	fi      	
	alerta2 "Verificando se a pasta foi criada com sucesso em "$PASTA_PROJETOS/$PROJETO
        arqSairSeArquivoExistir $PASTA_PROJETOS/$PROJETO 'Erro criando pasta '$PROJETO' em: '$PASTA_PROJETOS' via git clone cheque as permissões'
}



for PROJETO in "${PROJETOS_COLETIVO_JAVA_CORE_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_CORE[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done
for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done

for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done

for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done
