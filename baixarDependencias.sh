#!/bin/bash

# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#

source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
alerta "Verificando instalação de programas nescessários: git e Maven"
sudo yum -y install git
sudo yum -y install maven

alerta "Criando Pasta Source do Coletivo Java"
mkdir $CAMINHO_SOURCE_COLETIVO -p
alerta "Criando Pasta Source para projetos de desenvolvimento do Super-Bits Framework"
mkdir "$CAMINHO_SOURCE_SB" -p
alerta "Criando Pasta Release para projetos de desenvolvimento do Super-Bits Framework"
mkdir "$caminhoReleaseSB" -p
#alerta "Configurando Arquivos client.info, contendo o endereço do repositório Git do coletivo para source e release"
#echo "SERVIDOR_GIT_SOURCE=https://github.com/salviof" > "$caminhoSourceSB/cliente.info"
#echo "SERVIDOR_GIT_RELEASE=https://github.com/salviof/NAO_IMPLEMENTADO" > $caminhoReleaseSB/cliente.info
#mkdir /home/superBits/projetos/Super_Bits/source -p
#mkdir /home/superBits/projetos/Super_Bits/release -p
mkdir /home/superBits/recursos/ -p
cd /home/superBits/recursos

#git clone https://github.com/salviof/SBComp.git
#git clone https://github.com/salviof/WEB-INF.git
cd /home/superBits/projetos/Super_Bits/source 
alerta "Clonando editor de componentes em Super_Bits"
git clone https://github.com/salviof/SB_CRIADOR_COMPONENTE
alerta "Clonando Modulo Admin Tools em Super_Bits"
git clone https://github.com/salviof/SB_AdminTools
alerta "Clonando SBProjetos em Super_Bits"
git clone https://github.com/salviof/SB_Projetos
alerta "Instalando Framework"
cd $CAMINHO_SOURCE_COLETIVO
git clone https://github.com/salviof/FWColetivoJava.git
cd $CAMINHO_SOURCE_COLETIVO/FWColetivoJava
./baixarDependencias.sh
cd $CAMINHO_SOURCE_COLETIVO/FWColetivoJava
./dependenciasErpOpen.sh
./compilarTudo.sh
#alerta "Clonando Modulos Básicos Super Bits frame Work"
#git clone https://github.com/salviof/SuperBits_FrameWork.git
#alerta "Clonando Modulo Controle de Usuários Básico"
#git clone https://github.com/salviof/Controle_Usuario_Basico
#alerta "Clonando Criado de componente JSF"


#alerta "Compilando Tema Padrão JSF"
#cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/bibliotecas
#./instalaTema.sh


#alerta "Compilando FrameWork"
   
#cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SB_FRAMEWORK
#mvn clean install    -Dmaven.test.skip=true
#alerta "Compilando utilitário SBShell"
#cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/utilitarios/SBShell/shellCommands
#mvn clean install    -Dmaven.test.skip=true

#alerta "Compilando model Regras do projeto"
#cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SBProjetos/model_regras
#mvn -DskipTests=true clean install



#alerta "Compilando SBComandos"
#cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SBProjetos/SBComandos
#mvn clean install    -Dmaven.test.skip=true
#alerta "Compilando Módulo Controle de usuários padrão "
#cd /home/superBits/projetos/Super_Bits/source/Controle_Usuario_Basico/
#mvn clean install    -Dmaven.test.skip=true

#alerta "Combinando Módulo Admin Tools"
#cd /home/superBits/projetos/Super_Bits/source/SB_AdminTools/modelRegras/
#mvn clean install    -Dmaven.test.skip=true
#cd /home/superBits/projetos/Super_Bits/source/SB_AdminTools/webApp
#mvn clean install    -Dmaven.test.skip=true
#./empacotarModulo.sh


alerta "--Executando SBConcole"
echo "java -jar /home/superBits/projetos/Super_Bits/source/SBProjetos/SBComandos/target/SBComandos-0.9.one-jar.jar" > /home/superBits/SBConsole.sh
cd /home/superBits
chmod +x ./SBConsole.sh

#./SBConsole.sh

