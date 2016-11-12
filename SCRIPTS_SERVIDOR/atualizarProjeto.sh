

ARGUMENTOS_ESPERADOS=1
NOME_PASTA_REPOSITORIO_SERVIDOR=$1.git
NOME_PROJETO=$1


echo "nome pasta Projeto====$NOME_PASTA_REPOSITORIO_SERVIDOR"
# Verificando se o o Cliente e o Projeto foram enviados
if [ $# -ne $ARGUMENTOS_ESPERADOS ]
then
  echo "O parametro nome do projeto não foi enviado $0 ;) "
  exit $E_BADARGS
fi

#Verificando se relase do projeto existe


CAMINHO_PASTA_SERVIDOR=~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR
if [ ! -d "$CAMINHO_PASTA_SERVIDOR" ]
then
  echo "O repositorio Relase do projeto não foi encontrado EM ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR  $0  "
  exit $E_BADARGS
fi




cd ~/publicados
git clone ~/gitServer/release/$NOME_PASTA_REPOSITORIO_SERVIDOR

cd ~/publicados/$NOME_PROJETO
git pull orign master
git add --all 
git commit -m 'comit reverso alteraçoes pasta servidor'
git push
git pull orign master
git add --all 
git commit -m 'comit reverso alteraçoes pasta servidor'
git push
git pull orign master


#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
# (OLD)para compatibilidade
source ~/publicados/$NOME_PROJETO/cliente.info
#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
#NOVO
source ~/publicados/$NOME_PROJETO/SBProjeto.prop

echo " Atualizando  $ENDERECO_WEB_REQUISITO"
echo " e  $SERVIDOR_REQUISITOS"


# Adiciona o contecto no Jetty	
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "   <Set name=\"war\">/home/git/publicados/$NOME_PROJETO/$NOME_PROJETO.war</Set> " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "       <Item>$ENDERECO_WEB</Item>  " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo "   </Set> " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml
echo " </Configure> " >>  ~/servidor/jetty9/webapps/$NOME_PROJETO.xml

ARQ_PROJ_REQUISITO=$NOME_PROJETO.req.xml

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "   <Set name=\"war\">/home/git/publicados/$proj/$proj.req.war</Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "       <Item>$ENDERECO_WEB_REQUISITO</Item>  " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo "   </Set> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO
echo " </Configure> " >>  ~/servidor/jetty9/webapps/$ARQ_PROJ_REQUISITO

