#!/bin/bash
#Garante que o interpretador utilizado será BashScript (nescessário em alguns casos)
# Este script depende do módulo Super-Bits DevOps encontrado em: https://github.com/salviof/superBitsDevOps

# Chamando funções do core
source /home/superBits/superBitsDevOps/core/coreSBBash.sh
#

AMBIENTE_SB=/home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
source $AMBIENTE_SB

echo "$caminhoFrameWork"
alerta "Bem Vindo ao sistema de Softwares Super-Bits"
alerta "Somos Entusiastas do Open-source "
alerta "Antes de começar, você precisa instalar o NetBeans, e o JAVA 8"
alerta "só contiue a execução caso tenha o Java 1.8 Maven Git, e o Netbens instalado, ok? (ctr+c para sair)"
alerta "Caso não tenha instalado, execute o script instalar aplicativos antes  (ctr+c para sair)"
pause
alerta "Para proseguir, precisamos de algumas informações básicas."
alerta "Qual o Seu nome?"
read nome
alerta "Qual seu e-mail cadastrado no Git HUB?"
read email
alerta "Ok, $nome, podemos começar, o script será executado até o final a partir de agora."
alerta "Executaremos as seguintes tarefas, leia e veja se concorda antes de executar:"
alerta "1- criação do diretorio $caminhoSourceSB"
alerta "2- Sincronização com o Framework neste diretorio, com a url: $urlRepositorioSBFW"
alerta "Alteração em Seu nome e Email configurado no git para declaração de autor no git"
alerta "Alteração no git para salvar seu usuário e senha em cache por X horas"
alerta "Tecle  enter se tiver de acordo, ou ctr + c para sair"
alerta "Voce pode alterar as variaveis deste Script em $variaveisSB "
alerta "não se acanhe em dar uma olhada nesses scripts, e pensar em como melhorar seu funcionamento e documentação"
alerta "TODOS OS SCRIPTS FORAM ESCRITOS PENSANDO EM DESENVOLVIMENTO COLABORATIVO"
alerta "para sair, digit ctr +c"
alerta "Preparando ambiente para mudar o mundo com open-source? [ENTER]"
pause
git config --global user.name "$nome"
git config --global user.email "$email"
alerta "Configurando git para armazenar senhas"
git config --global credential.helper store
alerta "Configurando vimdiff como aplicativo padrão para resolução de confitos"
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
#echo "criando diretorio $caminhoSourceFJ"
#mkdir "$caminhoSourceSB" -p
#mkdir "$caminhoReleaseSB" -p
#echo "SERVIDOR_GIT_SOURCE=https://github.com/salviof" > "$caminhoSourceSB/cliente.info"

#echo "SERVIDOR_GIT_RELEASE=https://github.com/salviof/NAO_IMPLEMENTADO" > $caminhoReleaseSB/cliente.info

#cd "$caminhoSourceSB"
#git clone "$urlRepositorioSBFW"


mkdir $PASTA_TRABALHO_USUARIO -p
echo "TRABALHO_ATUAL=\"Tarefa não Especificada\"" > $ARQUIVO_TRABALHO_USUARIO
#cd "$caminhoSBFW/manualImport"
#./instalaTema.sh
#./instalaMysql.sh
#cd "$caminhoSBFW/EditorImagem"
#./compilaProjeto.sh 
#cd $caminhoSBFW
#./compilaProjeto.sh 
#cd $caminhoSourceSB
#git clone https://github.com/salviof/SB_AdminTools.git
#cd $caminhoSourceSB/SB_AdminTools
#git clone https://github.com/salviof/SB_CRIADOR_COMPONENTE.git
 



alerta  "Procurando chave SSH em " /home/$USER/.ssh/*pub

if ! ls /home/$USER/.ssh/*pub
        then
      	alerta "Parece que você ainda não tem uma chave publica de ssh :(.."
	alerta "Aperte enter para instalar gerar uma chave para o usuário $USER "
	pause
	ssh-keygen	
	#git config --global --unset section.key
fi

cp /home/superBits/superBitsDevOps/estacaoDeveloperOps/configNetBeans/Templates ~/.netbeans/8.2/config/ -R
