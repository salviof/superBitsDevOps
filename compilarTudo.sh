# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`
echo "Inicializando Funções bash em $SCRIPTPATH"
source $SCRIPTPATH/core/coreSBBash.sh
source $SCRIPTPATH/VARIAVEIS/SB_VARIAVEIS.sh

compilarProjeto(){
PASTA_PROJETOS=$1
PROJETO=$2
 	
	alerta1 "Analizando projeto "$PASTA_PROJETOS/$PROJETO
        arqSairSeArquivoExistir $PASTA_PROJETOS/$PROJETO 'Erro acessando pasta em: '+$PASTA_PROJETOS/$PROJETO+' execute o script baixarDependencias.sh'	
	cd $PASTA_PROJETOS/$PROJETO
	mvn clean install -DskipTests=true 	
	
}
cd /home/superBits/projetos/coletivoJava/source/integracao/intMatrixChat/
./dependenciaEmbarcada.sh
for PROJETO in "${PROJETOS_COLETIVO_JAVA_CORE_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_CORE[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	compilarProjeto $PASTA_PROJETOS $PROJETO;
done
for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	compilarProjeto $PASTA_PROJETOS $PROJETO;
done

for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	compilarProjeto $PASTA_PROJETOS $PROJETO;
done

for PROJETO in "${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK_ORDEM[@]}"; do
	NOME_PASTA_PROJETO=${PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK[$PROJETO]}
	PASTA_PROJETOS=${PASTAS_COLETIVO_JAVA_FW[$NOME_PASTA_PROJETO]}
	compilarProjeto $PASTA_PROJETOS $PROJETO;
done
alerta 'atualizacao do webAPP sem taglib desativada' 
#cd /home/superBits/projetos/Super_Bits/source/SB_CRIADOR_COMPONENTE/
#./atualizarWebAppSemTaglib.sh
alerta 'empacotamento do modulo SBAdminTools desabilitado' 
#cd /home/superBits/projetos/Super_Bits/source/SB_AdminTools/webApp
#./empacotarModulo.sh

