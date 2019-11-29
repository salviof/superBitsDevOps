#!/bin/bash
#Garante que o interpretador utilizado será BashScript (nescessário em alguns casos)
# Este script depende do módulo Super-Bits DevOps encontrado em: https://github.com/salviof/superBitsDevOps

# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#



function pause(){
   read -p "$*"
}
 
function pause(){
   read -p "$*"
}

echo "Script reservado, instação e ambiente java 1.8 e netbens"
cd ./aplicativos
alerta "O sistema irá instalar o jdk8 64 bits"
alerta "Em seguida o sistema irá perguntar qual "
alerta "a configuração para o caminho padrão do comando java através do comando alternatives "
pause
ENDERECO_SDK=http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163
ARQUIVO_SDK=jdk-8u131-linux-x64.rpm
PASTA_SDK=jdk1.8.0_131
alerta "Baixando JDK 1.8 64 bits Oracle "]
alerta "em : $ENDERECO_SDK/$ARQUIVO_SDK"

cd ~
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $ENDERECO_SDK/$ARQUIVO_SDK

cd ~
arqSairSeArquivoNaoExistir ~/$ARQUIVO_SDK "Houve um erro ao Baixar o arquivo JDK, verifique o novo endereço no site da oracle, atualise este arquivo, e se possível efetue um pull requeste de atualização para colaborar com esta alteração"

sudo rpm -Uvh /home/$USER/$ARQUIVO_SDK


alerta "você deverá informar o NUMERO CORRESPONDENTE ao caminho do  JAVA SKD 1.8 Oracle "

sudo alternatives --config java
sudo alternatives --config javac
sudo alternatives --config javaws
sudo alternatives --config jar

echo " CONFIGURANDO JAVA_HOME "
alerta "Adicionando caminho para o java home em ~/.bash_profile"
echo "export JAVA_HOME=/usr/java/$PASTA_SDK" >> ~/.bash_profile
export JAVA_HOME=/usr/java/$PASTA_SDK

echo "ATENÇÃO "
echo "precione enter para instalar o netbeans 8.1 "
pause
cd ~
ENDERECONETBEANS=http://download.netbeans.org/netbeans/8.2/final/bundles/
ARQUIVONETBEANS=netbeans-8.2-javaee-linux.sh
alerta "Baixando netbens em: $ENDERECONETBEANS/$ARQUIVONETBEANS"
wget $ENDERECONETBEANS/$ARQUIVONETBEANS
arqSairSeArquivoNaoExistir ~/$ARQUIVONETBEANS "O arquivo não foi encontrado, verifique a url correta do netbeans, se possível atualise este scritp e faça um pull request"
chmod +x $ARQUIVONETBEANS
cd ~
./$ARQUIVONETBEANS
alerta "Configurando o Java_home do netbeans"
setPropriedade netbeans_jdkhome /usr/java/$PASTA_SDK ~/netbeans-8.2/etc/netbeans.conf
alerta "O sistema irá instalar o Git"
sudo yum install git
alerta "O sistema irá instalar o Maven"
sudo yum install maven
alerta "O sistema irá instalar o XmlStarlet (manipulador de xml via linha de comando)"
sudo yum install xmlstarlet
#lerta "Para concluir a instalação configure o JAVA_HOME para /usr/java/$PASTA_SDK em ~/netbeans-8.2/etc/netbeans.conf "
#pause
#vim ~/netbeans-8.2/etc/netbeans.conf

