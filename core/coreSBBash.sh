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
# Bash significa: (Bourne Again Shell) em homenagem ao Sr Bourne.
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
SBCORE_ESTILO_ORIGINAL='\033[0m'
function alerta() {
    pMensagem="$1"
    echo -e -n "\033[1;36m$pMensagem"   
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
    echo " "
}
function alertaMuitoImportante() {
    pMensagem="$1"
    echo -e -n "\033[1;36m$pMensagem"   
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
   exit 
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