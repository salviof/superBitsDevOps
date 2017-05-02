#!/bin/bash
# init
function pause(){
   read -p "$*"
}
 
function pause(){
   read -p "$*"
}

echo "Script reservado, instação e ambiente java 1.8 e netbens"
cd ./aplicativos
echo "O sistema irá instalar o jdk8 64 bits"
echo "Em seguida o sistema irá perguntar qual "
echo "a configuração para o caminho padrão do comando java "
pause
cd ~
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm

sudo yum install ./jdk-8u102-linux-x64.rpm

echo "você deverá informar o NUMERO CORRESPONDENTE ao caminho do  JAVA 1.8 "

sudo alternatives --config java
sudo alternatives --config javac
sudo alternatives --config javaws
sudo alternatives --config jar

echo " CONFIGURANDO JAVA_HOME "

echo "export JAVA_HOME=/usr/java/lastest" >> ~/.bash_profile
export JAVA_HOME=/usr/java/latest     

echo "ATENÇÃO "
echo "precione enter para instalar o netbeans 8.1 "
pause
cd ~
wget http://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-javaee-linux.sh
sudo chmod +x netbeans-8.0.2-javaee-linux.sh
sudo ./netbeans-8.0.2-javaee-linux.sh


