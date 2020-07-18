# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
alerta "Inicializando Funções bash em $SCRIPTPATH"
source $SCRIPTPATH/core/coreSBBash.sh
source $SCRIPTPATH/VARIAVEIS/SB_VARIAVEIS.sh

atualizarProjeto(){
PASTA_PROJETOS=$1
PROJETO=$2
 	
	alerta1 "Analizando projeto "$PASTA_PROJETOS/$PROJETO
	if arqArquivoExiste '$CAMINHO_PROJETO_CORE/$PROJETO_CORE/.git/config'; 
        then 
        cd $PASTA_PROJETOS
	alerta2 'Clonando Repositorio https://github.com/salviof/'$PROJETO
	git clone https://github.com/salviof/$PROJETO	
        else 
	alerta2 'Atualizando Repositorio https://github.com/salviof/'$PROJETO
	cd $PASTA_PROJETOS/$PROJETO
	git pull
	fi      	
	arqSairSeArquivoExistir $PASTA_PROJETOS/$PROJETO 'Erro criando pasta em: '+$PASTA_PROJETOS/$PROJETO+' cheque as permissões'
}

for PASTA_PROJETO in "${!PASTAS_COLETIVO_JAVA_FW[@]}"; do
	CAMINHO_PASTA_PROJETO=${PASTAS_COLETIVO_JAVA_FW[$PASTA_PROJETO]}
	alerta "Criando pasta $CAMINHO_PASTA_PROJETO";
       	mkdir $CAMINHO_PASTA_PROJETO -p
	arqSairSeArquivoExistir $CAMINHO_PASTA_PROJETO 'Erro criando pasta em: '+$CAMINHO_PASTA_PROJETO+' cheque as permissões'
done

for PROJETO in "${!PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done
for PROJETO in "${!PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done

for PROJETO in "${!PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	atualizarProjeto $PASTA_PROJETOS $PROJETO;
done
