declare -A PASTAS_COLETIVO_JAVA_FW
PASTAS_COLETIVO_JAVA_FW=(
["PASTA_COLETIVO_JAVA_FERRAMENTAS"]="$CAMINHO_SOURCE_SB" #todo encontrar novo diretorio padrão
["PASTA_COLETIVO_JAVA_FRAMEWORK"]="$CAMINHO_SOURCE_COLETIVO/fw"
["PASTA_COLETIVO_JAVA_FRAMEWORK_UTIL"]="$CAMINHO_SOURCE_COLETIVO/fw/util"
["PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"]="$CAMINHO_SOURCE_COLETIVO"
["PASTA_COLETIVO_JAVA_INTEGRACOES"]="$CAMINHO_SOURCE_COLETIVO/integracao"
["PASTA_COLETIVO_JAVA_ERP"]="$CAMINHO_SOURCE_COLETIVO/erpColetivoJava"
)


declare -A PROJETOS_COLETIVO_JAVA_CORE
PROJETOS_COLETIVO_JAVA_CORE=(
["MTFN"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"
["reflections"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE"
["SBApiCore"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["apiComunicacao"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SbErpCodigoPostalBR"]="PASTA_COLETIVO_JAVA_ERP"
["SBCore"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBTeste"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["util"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBPersistencia"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBServlets"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBRestClient"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBRestClientTestes"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["SBAcessosModel"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["apiComunicacao"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpGatewayPagamento"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpIntegracaoSistemas"]="PASTA_COLETIVO_JAVA_ERP"
["SBWebPaginas"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
["FWColetivoJava"]="PASTA_COLETIVO_JAVA_FRAMEWORK"
)
PROJETOS_COLETIVO_JAVA_CORE_ORDEM=("MTFN" "reflections" "SBApiCore" "apiComunicacao" 
 "SbErpCodigoPostalBR" "SBCore" "SBTeste" "util" "SBPersistencia" "SBServlets" "SBRestClientTestes" "SBRestClient"  "SBAcessosModel"
 "SBErpGatewayPagamento" "SBErpIntegracaoSistemas" "SBWebPaginas" "FWColetivoJava")
declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK=(
["SB_CRIADOR_COMPONENTE"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
)
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_FRAMEWORK_ORDEM=("SB_CRIADOR_COMPONENTE")
declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO=(
["SB_AdminTools"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
["SBProjetos"]="PASTA_COLETIVO_JAVA_FERRAMENTAS"
["SBAplicacaoModelo"]="PASTA_COLETIVO_JAVA_DEPENDENCIAS_EXTERNAS_CORE" #todo mover para ferramentas
["Controle_Usuario_Basico"]="PASTA_COLETIVO_JAVA_FERRAMENTAS" #depreciado
)

PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ORDEM=("SB_AdminTools" "SBProjetos" "SBAplicacaoModelo" "Controle_Usuario_Basico")

declare -A PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO
PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO=(
["SbErpCodigoPostalBRApiFreeRedundante"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpCodigoPostalBRRepublicaVirtual"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpCodigoPostalImportador"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpGatewayPagamento"]="PASTA_COLETIVO_JAVA_ERP"
["SBErpIntegracaoSistemas"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpTarefas"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpTarefasClickup"]="PASTA_COLETIVO_JAVA_ERP"
["intAmazonShortMessageService"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intWhatsapp"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intMatrixChat"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intGatewayPgtoRede"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intMautic"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intRocketChat"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intERPRestful"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intERPRestfulTest"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intWordpress"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intMav"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intGoogleCalendar"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intClickup"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["SbErpChat"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpChatMatrixOrg"]="PASTA_COLETIVO_JAVA_ERP"
["SbErpContaPagarReceber"]="PASTA_COLETIVO_JAVA_ERP"
["intGalaxPay"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
["intQrcodePix"]="PASTA_COLETIVO_JAVA_INTEGRACOES"
)

PROJETOS_COLETIVO_JAVA_DESENVOLVEDOR_PROJETO_ERP_COMPLETO_ORDEM=("SbErpCodigoPostalBRApiFreeRedundante" "SbErpCodigoPostalBRRepublicaVirtual" "SbErpCodigoPostalImportador" "SBErpGatewayPagamento" "SBErpIntegracaoSistemas" "SbErpTarefas" "SbErpTarefasClickup" "intAmazonShortMessageService" "intGatewayPgtoRede" "intMautic" "intRocketChat" "intERPRestful" "intERPRestfulTest" "intWordpress" "intMav" "intGoogleCalendar" "intClickup" "SbErpChat" "SbErpChatMatrixOrg" "SbErpContaPagarReceber" "intGalaxPay" "intQrcodePix","intMatrixChat","intWhatsapp")

