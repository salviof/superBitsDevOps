cd /home/superBits/projetos/coletivoJava/source/fw/FWColetivoJava
mvn clean install -DskipTests=true
cd /home/superBits/projetos/Super_Bits/source/SB_CRIADOR_COMPONENTE/modelRegras
mvn clean install -DskipTests=true
cd /home/superBits/projetos/Super_Bits/source/SB_CRIADOR_COMPONENTE/
./atualizarWebAppSemTaglib.sh
cd /home/superBits/projetos/coletivoJava/source/fw/FWColetivoJava/ferramentasDev
mvn clean install -DskipTests=true
cd /home/superBits/projetos/Super_Bits/source/SB_AdminTools/webApp
./empacotarModulo.sh
cd home/superBits/projetos/coletivoJava/source/fw/FWColetivoJava/erpColetivo/
mvn clean install -DskipTests=true
cd /home/superBits/projetos/coletivoJava/source/integracao/intMautic
mvn clean install -DskipTests=true
cd /home/superBits/projetos/coletivoJava/source/integracao/intRocketChat
mvn clean install -DskipTests=true




