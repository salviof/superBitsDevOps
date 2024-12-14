############################################################################################ 
#   Super-Bits Bash-Script Core Hacks   
#
#  Versao 0.5 Beta https://github.com/salviof/superBitsDevOps
#
# Objetivo: fornecer funções básicas que facilitem e incentivem a criação de DEVops via 
# bash Scritp.
#
#
#
# Toda função deste arquivo deve ser documentada para melhor compreenção dos utilizadores, 
# Quer adicionar uma função neste arquivo? Faça um fork, e envie um pull Request.
# Caso a função tenha sido testada, seja útil e documentada sua contribuição será 
# bem vinda.
#
# Normas: Utilize pNomeDoparametro em parametros de função para evitar conflitos
#         Utilize SBCORE_ para criar variavies globais 
#  	  Ao escrever uma função para um modulo inicie o nome da funcao com um slug do modulo
#	  Sempre adicione um exemplo a documentação
#
# As funções deste arquivo devem ser simples, caso a função utilize aplicações de terceiros considere CRIAR, ou atualizar um modulo adicional adicional
# ex de comandos aceitaveis: sed, cat, tail, find, mv, rm, chmod etc.. 
# ex de comandos que devem fazer parte de algum modulo: ifconfig, xmlstarlet, service yum etc....
#
#
# Curiosidade: A primeira versão do  Shell script foi criada em 1975 por S.R Bourne, em 1989 a fundação GNU adotou e evoluiu
# este projeto. com objetivo de poder fazer TUDO oque você quiser via linha de comando.
# Bash significa: (Bourne Again Shell), um trocadilho de Bourne Again (Renascido) em homenagem ao Sr Bourne.
# Dizem que os programadores que utilizam Bash são incrivelmente mais poderosos do que aqueles acostumandos apenas com 
# as linhas de commando do Windows. A microsof tem muita vontade de incluir o Bash no sistema operacional, mas
# um bash script sem uma infinidade de aplicativos feitos para comunicar com a ferramenta não é muito útil.
# 
#
# Que a força esteja com você!
#
##########################################################################################################

############################# Mensagens #######################################################
# exemplo: msgAlerta Colé Jedi?

RESTORE=$(echo -en '\033[0m;0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MAGENTA=$(echo -en '\033[38;5m;200')
PURPLE=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LIGHTGRAY=$(echo -en '\033[00;37m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')
LBLUE=$(echo -en '\033[01;34m')
LMAGENTA=$(echo -en '\033[01;35m')
LPURPLE=$(echo -en '\033[01;35m')
LCYAN=$(echo -en '\033[01;36m')
WHITE=$(echo -en '\033[01;37m')
ROSA=$(echo -en '\033[40m\033[1;35m')
### Estilo padrão
SBCORE_ESTILO_ORIGINAL='\033[0m'
magenta='\x1b[97m'
pink=$'\x1b[97m'
E_BADARGS=85

function alerta() {
    pMensagem="$1"
    echo $LCYAN
    echo "$pMensagem"
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
  
}

############################
#Agradecimento a:https://gist.github.com/kongchen
# uso: setPropriedade $key $value $filename
# -> Caso não encontre a propriedade, nada acontece
# -> Utiliza o diretorio ~ para criar um arquivo temporário
# O awk, é um comando poderoso, semelhante ao sed, o paramero $0 representa uma linha inteira, e o operador "~" valida um regex, caso haja comentários na mesma linha da variavel, o comentário será apagado
# você pode ver outros exemplos em https://likegeeks.com/awk-command/
function setPropriedade(){
  awk -v pat="^$1=" -v value="$1=$2" '{ if ($0 ~ pat) print value; else print $0; }' $3 > ~/configvar.tmp
  mv ~/configvar.tmp $3
}


function alerta1() {
    pMensagem="$1"
    echo $ROSA
    echo "$pMensagem"
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
 

}


function alerta2() {
    pMensagem="$1"
    echo -e -n "\033[01;32m$pMensagem"   
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
    echo " "
}





function alertaMuitoImportante() {
    pMensagem="$1"
    echo -e -n "\033[01;31m$pMensagem"   
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
    echo " "
}
###########################################################################
# Nomes amigaveis para uma pausa com enter para proceguir
# exemplo: pausar
function pausar(){
read
}
function pause(){
read
}
function solicitarEnter(){
read
}
############### Armazenamento ####################################
# exemplo: 
# if arqEUmDiretorio '/home/superBits'; 
# then echo "é um diretório "; 
# else echo " num é diretorio não..."; fi

arqEUmDiretorio() {
  if [ -d "$1" ]
  then
    # 0 = verdadeiro
    return 0 
  else
    # 1 = falso
    return 1
  fi
}

arqDiretorioExiste() {
  if [ -d "$1" ]
  then
    # 0 = verdadeiro
    return 0 
  else
    # 1 = falso
    return 1
  fi
}

# Veradeiro se o caminho enviado for um arquivo
arqEUmArquivo() {
  if [ -f "$1" ]
  then
    # 0 = verdadeiro
    return 0 
  else
    # 1 = falso
    return 1
  fi
}
# Veradeiro se o arquivo existir no caminho enviado
arqArquivoExiste() {
  if [ -f "$1" ]
  then
    # 0 = verdadeiro
    return 0 
  else
    # 1 = falso
    return 1
  fi
}


###################################################

arqSairSeArquivoNaoExistir(){
pDiretorio=$1
pMensagem=$2
 if [ -f "$pDiretorio" ]
  then
   
    return 0 
  else
   alerta $pMensagem
   exit 0
  fi
}

arqSairSeArquivoExistir(){
pDiretorio=$1
pMensagem=$2
 if [ -f "$pDiretorio" ]
  then
   alerta "$pMensagem"
   exit  
  else
  return 1 
   
  fi

}

arqSairSePastaNaoExistir(){
pDiretorio=$1
pMensagem=$2
 if [ -d "$pDiretorio" ]
  then
    return 0 
  else
   alerta "$pMensagem"
   exit 
  fi

}

arqSairSePastaExistir(){
pDiretorio=$1
pMensagem=$2
 if [ -d "$pDiretorio" ]
  then
   alerta "$pMensagem"
   exit  
  else
  return 1 
   
  fi

}

arqComandoExiste(){
 return type "$1" &> /dev/null ;
}




# forka isso, e pull requesta -> https://github.com/salviof/superBitsDevOps
