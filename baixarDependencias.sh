#!/bin/bash

# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#

source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
alerta "Verificando instalação de programas nescessários: git e Maven"
sudo yum install git
sudo yum install maven

alerta "Criando Pasta Source do Coletivo Java"
mkdir "$caminhoSourceSB" -p
alerta "Criando Release do Coletivo Java"
mkdir "$caminhoReleaseSB" -p
alerta "Configurando Arquivos client.info, contendo o endereço do repositório Git do coletivo para source e release"
echo "SERVIDOR_GIT_SOURCE=https://github.com/salviof" > "$caminhoSourceSB/cliente.info"
echo "SERVIDOR_GIT_RELEASE=https://github.com/salviof/NAO_IMPLEMENTADO" > $caminhoReleaseSB/cliente.info



mkdir /home/superBits/projetos/Super_Bits/source -p
mkdir /home/superBits/projetos/Super_Bits/release -p
mkdir /home/superBits/recursos/ -p
cd /home/superBits/recursos
alerta "Clonando Coposite Componentes e configurações de Web-Inf padrão"
git clone https://github.com/salviof/SBComp.git
git clone https://github.com/salviof/WEB-INF.git
cd /home/superBits/projetos/Super_Bits/source 
alerta "Clonando Modulos Básicos Super Bits frame Work"
git clone https://github.com/salviof/SuperBits_FrameWork.git
alerta "Clonando Modulo Controle de Usuários Básico"
git clone https://github.com/salviof/Controle_Usuario_Basico
alerta "Clonando Criado de componente JSF"
git clone https://github.com/salviof/SB_CRIADOR_COMPONENTE
alerta "Clonando Modulo Admin Tools "  
git clone https://github.com/salviof/SB_AdminTools

alerta "Compilando Tema Padrão JSF"
cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/bibliotecas
./instalaTema.sh

alerta "Compilando Core"
cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SB_FRAMEWORK/SBCore
mvn clean install    -Dmaven.test.skip=true

alerta "Compilando Editor Imagem"
cd  /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/utilitarios/EditorImagem/
mvn clean install -Dmaven.test.skip=true


alerta "Compilando SB PErsistencia"
cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SB_FRAMEWORK/SBPersistencia
mvn clean install  -Dmaven.test.skip=true


alerta "Compilando Acesso Model"
cd  /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SB_FRAMEWORK/SBAcessosModel/
mvn clean install    -Dmaven.test.skip=true

alerta "Compilando FrameWork"
cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SB_FRAMEWORK/
mvn clean install    -Dmaven.test.skip=true
alerta "Compilando utilitário SBShell"
cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/utilitarios/SBShell/shellCommands
mvn clean install    -Dmaven.test.skip=true

cd /home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork/SBProjetos/model_regras/
mvn clean install    -Dmaven.test.skip=true





