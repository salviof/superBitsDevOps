#!/bin/bash
# init
function pause(){
   read -p "$*"
}
 
function pause(){
   read -p "$*"
}
$caminhoFrameWork=/home/superBits/projetos/Super_Bits/source/SuperBits_FrameWork
$caminhoSourceSB=/home/superBits/projetos/Super_Bits/source
echo "Bem Vindo ao sistema de Softwares Super-Bits"
echo "Somos Entusiastas do Open-source "
echo "Antes de começar, você precisa instalar o NetBeans, e o JAVA 8"
echo "só contiue a execução caso tenha o Java 1.8 e o Netbens instalado, ok?"
pause
echo "Para proseguir, precisamos de algumas informações básicas."
echo "Qual o Seu nome?"
read nome
echo "Qual seu e-mail cadastrado no Git HUB?"
read email
echo "Ok, $nome, podemos começar, este script executará as seguintes tarefas:"
echo "Tecle  enter se tiver de acordo, ou ctr + c para sair"
echo "* Você digitou seu nome: $nome e e-mail $email corretamente?"
pause

echo "Preparando ambiente para mudar o mundo com open-source"

sudo yum install git -y
sudo git config --global user.name $nome
sudo git config --global user.email $email
mkdir /home/superBits/projetos/Super_Bits/source -p
cd $caminhoSourceSB
git clone https://github.com/salviof/SuperBits_FrameWork
cd $caminhoFrameWork




