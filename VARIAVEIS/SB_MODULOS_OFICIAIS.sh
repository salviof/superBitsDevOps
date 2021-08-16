declare -A PASTAS_COLETIVO_JAVA_FW
PASTAS_COLETIVO_JAVA_FW=(
["PASTA_COLETIVO_JAVA_FERRAMENTAS"]="$CAMINHO_SOURCE_SB" #todo encontrar novo diretorio padrão
["PASTA_COLETIVO_JAVA_FRAMEWORK"]="$CAMINHO_SOURCE_COLETIVO/fw"
["PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"]="$CAMINHO_SOURCE_COLETIVO"
["PASTA_COLETIVO_JAVA_INTEGRACOES"]="$CAMINHO_SOURCE_COLETIVO/integracao"
["PASTA_COLETIVO_JAVA_ERP"]="$CAMINHO_SOURCE_COLETIVO/erpColetivoJava"
)


declare -A PROJETOS_COLETIVO_JAVA_CORE
PROJETOS_COLETIVO_JAVA_CORE=(
["MTFN"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"
["reflections"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"
["SBApiCore"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SbErpCodigoPostalBR"]="PASTA_COLETIVO_JAVA_ERP"
["SBTeste"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBServlets"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBRestClient"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBRestClientTestes"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["util"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBPersistencia"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBAcessosModel"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["apiComunicacao"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpGatewayPagamento"]="PASTA_COLETIVO_JAVA_ERP"
["SBWebPaginas"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["FWColetivoJava"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
)

declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK=(
["SB_CRIADOR_COMPONENTE"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
)

declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO=(
["SB_AdminTools"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
["SBProjetos"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
["SBAplicacaoModelo"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE" #todo mover para ferramentas
#["Controle_Usuario_Basico"]="PASTA_COLETIVO_JAVA_FERRAMENTAS" depreciado
)

declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO=(
["SbErpCodigoPostalBRApiFreeRedundante"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpCodigoPostalBRRepublicaVirtual"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpCodigoPostalImportador"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpGatewayPagamento"]="PASTA_COLETIVO_JAVA_ERP"
["intAmazonShortMessageService"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intGatewayPgtoRede"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intMautic"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intRocketChat"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
)


