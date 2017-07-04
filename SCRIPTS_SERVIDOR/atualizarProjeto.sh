ARGUMENTOS_ESPERADOS=3
NOME_PASTA_REPOSITORIO_SERVIDOR=$1.git
NOME_PROJETO=$1
prATUALIZAR_REQUISITO=$2
prRespostaLimpar=$3
source ~/superBitsDevOps/core/coreSBBash.sh

echo "nome pasta Projeto====$NOME_PASTA_REPOSITORIO_SERVIDOR"
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
	echo "O parametro nome do projeto não foi enviado impossível executar o atualizarProjeto.sh $0 ;) "
	exit $E_BADARGS
fi

#Verificando se relase do projeto existe
ATUALIZAR_REQUISITO=false
if [[ $prATUALIZAR_REQUISITO == *"SIM"* ]]
then
	ATUALIZAR_REQUISITO=true
fi

CAMINHO_PASTA_SERVIDOR=~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
if [ ! -d "$CAMINHO_PASTA_SERVIDOR" ]
then
	echo "O repositorio Relase do projeto não foi encontrado EM ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR  $0  "
	exit $E_BADARGS
fi




if [ $prRespostaLimpar == "SIM" ]
then

	# CRIAR BACKUP DO PROEJTO
	alerta "Criando diretorio do projeto em: ~/backup/$NOME_PROJETO "
	mkdir -p ~/backup/$NOME_PROJETO
	alerta "Carregando source coreSBBash"
	source ~/superBitsDevOps/core/coreSBBash.sh

	#SCRIPT DE BACKUP FULL REALIZADO DO FILESERVER  

	alerta "Definindo variaveis de BACKUP"
	#VARIAVEIS  
	INICIO=`date +%d/%m/%Y-%H:%M:%S`  
	LOG=~/backup/$NOME_PROJETO/$NOME_PROJETO_`date +%Y-%m-%d`_log-backup-full.txt

	alerta "Buscando origem do UltimoBackup" 
	#DEFINA AQUI O DIRETÓRIO QUE SERÁ EFETUADO O BACKUP DO BACKUP
	ORIGEM=~/backup/$NOME_PROJETO/ultimoBackup_$NOME_PROJETO.tar.gz

	alerta "Definindo destino do PenultimoBackup" 
	#DEFINA AQUI O DIRETÓRIO ONDE O ARQUIVO SERÁ GRAVADO JUNTO COM O SEU NOME  
	DESTINO=~/backup/$NOME_PROJETO/penultimoBackup_$NOME_PROJETO.tar.gz

	#CRIA O ARQUIVO DE LOGS  
	echo " " >> $LOG  
	echo " " >> $LOG  
	echo "|-----------------------------------------------" >> $LOG  
	echo " Backup iniciado em $INICIO" >> $LOG  

	alerta "Verificando se o arquivo existe"
	if [ -f "$ORIGEM" ]
	then
		alerta "Copiando UltimoBackup para PenultimoBackup"

		alerta "De: $ORIGEM --- Para: $DESTINO"

		#COPIA ULTIMO BACKUP PARA CRIAR NOVO
		cp $ORIGEM $DESTINO -r -f

	else

		alerta "Não existe Backup para ser arquivado!"

	fi

	alerta "Buscando diretorio para BACKUP"
	#DEFINA AQUI O DIRETÓRIO QUE SERÁ EFETUADO O NOVO BACKUP
	ORIGEM=~/publicados/$NOME_PROJETO/*

	alerta "Definindo destino do BACKUP"
	#DEFINA AQUI O DIRETÓRIO ONDE O ARQUIVO SERÁ GRAVADO JUNTO COM O SEU NOME  
	DESTINO=~/backup/$NOME_PROJETO/ultimoBackup_$NOME_PROJETO.tar.gz


	alerta "Iniciando Backup" 

	alerta "De: $ORIGEM --- Para: $DESTINO"

	#CRIA O BACKUP  
	alerta "Iniciando BACKUP"
	tar cvf $DESTINO $ORIGEM >> $LOG
	alerta "Fim do BACKUP"

	FINAL=`date +%d/%m/%Y-%H:%M:%S`  

	echo " Backup finalizado em $FINAL" >> $LOG  
	echo "|-----------------------------------------------" >> $LOG  
	echo " " >> $LOG  
	echo " " >> $LOG  

	alerta "Um LOG do Backup foi criando: $LOG"


	# APAGAR PASTA DO PROJETO

	alerta "Verificando se o nome do projeto foi informado"

	if [ ${#NOME_PROJETO} == 0 ]
	then
		exit
	fi  

	alerta "Verificando se diretorio existe"  
	arqSairSePastaNaoExistir ./publicados/$NOME_PROJETO "O Diretorio informado não existe!"

	alerta "Apagando diretorio: /~/publicados/$NOME_PROJETO"
	rm ~/publicados/$NOME_PROJETO -r -f


	# CRIAR PASTA DO PROJETO

	cd ~/publicados

	alerta "Iniciando clonagem do projeto no servidor"
	git clone ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
	alerta "Fim do processod e clonagem"
fi
	cd ~/publicados/$NOME_PROJETO

	git pull

	FIM DO SCRIPT DE BACKUP



#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
# (OLD)para compatibilidade
source ~/publicados/$NOME_PROJETO/cliente.info
#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
#NOVO
source ~/publicados/$NOME_PROJETO/SBProjeto.prop

echo " Atualizando  $ENDERECO_WEB_REQUISITO"
echo " e  $SERVIDOR_REQUISITOS"

rm ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml -f

# Adiciona o contecto no Jetty	
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "   <Set name=\"war\">/home/git/publicados/$GRUPO_PROJETO/$GRUPO_PROJETO.war</Set> " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "       <Item>$ENDERECO_WEB</Item>  " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo "   </Set> " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml
echo " </Configure> " >>  ~/servidor/jetty9/webapps/$GRUPO_PROJETO.xml


if $ATUALIZAR_REQUISITO ; then
	ARQ_PROJ_REQUISITO=$GRUPO_PROJETO.req.xml

	rm ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO -f

	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "   <Set name=\"war\">/home/git/publicados/$GRUPO_PROJETO/$GRUPO_PROJETO.req.war</Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "       <Item>$ENDERECO_WEB_REQUISITO</Item>  " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo "   </Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
	echo " </Configure> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
fi

