NOME_CLIENTE=$1
NOME_PROJETO=$2
NOME_SERVICO=$3


DIRETORIO_EXECUCAO=/home/git/publicados/$NOME_PROJETO
ARQUIVO_PROJETO=$NOME_SERVICO.jar


function alerta() {
    pMensagem="$1"
    echo $LCYAN
    echo "$pMensagem"
    echo -en "${SBCORE_ESTILO_ORIGINAL}"
  
}
alerta "teste iniciou "
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

alerta "core iniciado"
alerta "Procurando pacote em $DIRETORIO_EXECUCAO/$ARQUIVO_PROJETO"
arqSairSeArquivoNaoExistir $DIRETORIO_EXECUCAO/$ARQUIVO_PROJETO "O arquivo jar não foi encontrado em $DIRETORIO_EXECUCAO/$ARQUIVO_PROJETO"

alerta "O pacote do serviço foi encontrado"



if arqArquivoExiste "/usr/lib/systemd/system/$NOME_SERVICO.service"; then 
alerta "Serivço já foi instalado"
fi

ARQUIVO_CONFIG_SERVICO=/usr/lib/systemd/system/$NOME_SERVICO.service
if ! arqArquivoExiste "$ARQUIVO_CONFIG_SERVICO"; then
alerta "o serviço $NOME_SERVICO será instado"
echo "[Unit] " > $ARQUIVO_CONFIG_SERVICO
echo "Description=$NOME_SERVICO " >>  $ARQUIVO_CONFIG_SERVICO
echo "After=network.target  " >>  $ARQUIVO_CONFIG_SERVICO
echo "[Service]   " >>  $ARQUIVO_CONFIG_SERVICO
echo "Type=simple  " >>  $ARQUIVO_CONFIG_SERVICO
echo "WorkingDirectory=$DIRETORIO_EXECUCAO  " >>  $ARQUIVO_CONFIG_SERVICO
echo "ExecStart=/usr/java/latest/bin/java -jar $ARQUIVO_PROJETO  " >>  $ARQUIVO_CONFIG_SERVICO
echo "Servico $NOME_SERVICO foi instalado"
fi

echo "Servico $NOME_SERVICO será iniciado"

sudo /bin/systemctl stop $NOME_SERVICO 
sudo /bin/systemctl start $NOME_SERVICO 