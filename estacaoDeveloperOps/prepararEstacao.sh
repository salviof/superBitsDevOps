#!/bin/bash

variaveisSB=/home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
source /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh

echo "$caminhoFrameWork"
echo "Bem Vindo ao sistema de Softwares Super-Bits"
echo "Somos Entusiastas do Open-source "
echo "Antes de começar, você precisa instalar o NetBeans, e o JAVA 8"
echo "só contiue a execução caso tenha o Java 1.8 e o Netbens instalado, ok? (ctr+c para sair)"
pause
echo "Para proseguir, precisamos de algumas informações básicas."
echo "Qual o Seu nome?"
read nome
echo "Qual seu e-mail cadastrado no Git HUB?"
read email
echo "Ok, $nome, podemos começar, o script será executado até o final a partir de agora."
echo "Executaremos as seguintes tarefas, leia e veja se concorda antes de executar:"
echo "1- criação do diretorio $caminhoSourceSB"
echo "2- Sincronização com o Framework neste diretorio, com a url: $urlRepositorioSBFW"
echo "Alteração em Seu nome e Email configurado no git para declaração de autor no git"
echo "Alteração no git para salvar seu usuário e senha em cache por X horas"
echo "Tecle  enter se tiver de acordo, ou ctr + c para sair"
echo "Voce pode alterar as variaveis deste Script em $variaveisSB "
echo "não se acanhe em dar uma olhada nesses scripts, e pensar em como melhorar seu funcionamento e documentação"
echo "TODOS OS SCRIPTS FORAM ESCRITOS PENSANDO EM DESENVOLVIMENTO COLABORATIVO"
echo "para sair, digit ctr +c"
echo "Preparando ambiente para mudar o mundo com open-source? [ENTER]"
pause
git config --global user.name "$nome"
git config --global user.email "$email"
git config --global credential.helper store
echo "criando diretorio $caminhoSourceFJ"
mkdir "$caminhoSourceSB" -p
mkdir "$caminhoSourceFJ" -p
mkdir "$caminhoReleaseFJ" -p
mkdir "$caminhoReleaseSB" -p
echo "SERVIDOR_GIT_SOURCE=https://github.com/salviof" > "$caminhoSourceSB/cliente.info"
echo "SERVIDOR_GIT_SOURCE=https://github.com/salviof" > "$caminhoSourceFJ/cliente.info"
echo "SERVIDOR_GIT_RELEASE=https://github.com/salviof/NAO_IMPLEMENTADO" > $caminhoReleaseSB/cliente.info
echo "SERVIDOR_GIT_RELEASE=https://github.com/salviof/NAO_IMPLEMENTADO" > $caminhoReleaseFJ/cliente.info
cd "$caminhoSourceSB"
git clone "$urlRepositorioSBFW"

ssh-keygen


mkdir $PASTA_TRABALHO_USUARIO -p
echo "TRABALHO_ATUAL=\"Tarefa não Especificada\"" > $ARQUIVO_TRABALHO_USUARIO
#cd "$caminhoSBFW/manualImport"
#./instalaTema.sh
#./instalaMysql.sh
#cd "$caminhoSBFW/EditorImagem"
#./compilaProjeto.sh 
#cd $caminhoSBFW
#./compilaProjeto.sh 
cd ~/.ssh
git config --global --unset section.key

if ls ~/.ssh/*pub >/dev/null
        then
       	echo "Parece que você ainda não tem uma chave publica de ssh :(.."
	echo   "Siga as instruções para criar uma e poder acessar servidores ssh "
	pause
	ssh-keygen
fi


if [ -e .ssh/id_rsa.pub ];
then
 
fi

mkdir $caminhoHome -f



