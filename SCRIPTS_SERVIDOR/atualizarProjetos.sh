

#Para cada pasta do servidor de git, projetos 
while read linha
do
    projetos[ $idx ]="$linha"        
    (( idx++ ))
done < <(ls ~/gitServer/release/)

cd ~/servidor/jetty9/webapps/
rm *.xml


cd /home
for proj in "${projetos[@]}"
do :
nomeProjeto=$(echo $proj | sed -e 's/.git//')
echo "ATUALIZANDO PROJETO: $nomeProjeto"
# Faz um Git clone do repositorio na pasta publicados
mkdir ~/publicados/ -p
cd ~/publicados
git clone ~/gitServer/release/$proj


cd ~/publicados/$nomeProjeto
git pull

#Lê as informacoes do cliente (contendo o endereço do site que será homologado)
source ~/publicados/$nomeProjeto/cliente.info
source ~/publicados/$nomeProjeto/$nomeProjeto.info

echo " Atualizando  $SERVIDOR_HOMOLOGACAO"
echo " e  $SERVIDOR_REQUISITOS"

if [ $SERVIDOR_HOMOLOGACAO != "null" ];
 then

arqProjRequisito="$nomeProjeto.req.xml"
# Adiciona o contecto no Jetty	
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "   <Set name=\"war\">/home/git/publicados/$nomeProjeto/$nomeProjeto.war</Set> " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "       <Item>$SERVIDOR_HOMOLOGACAO</Item>  " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "   </Set> " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo " </Configure> " >>  ~/servidor/jetty9/webapps/$nomeProjeto.xml
echo "Atualizando $SERVIDOR_REQUISITOS -- $arqProjRequisito"
fi

if [ $SERVIDOR_REQUISITOS != "null" ];
then
echo "servidor de requisito nao e nulo"
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?> "> ~/servidor/jetty9/webapps/$arqProjRequisito
echo " <Configure class=\"org.eclipse.jetty.webapp.WebAppContext\"> " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "   <Set name=\"contextPath\">/</Set> " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "   <Set name=\"war\">/home/git/publicados/$nomeProjeto/$nomeProjeto.req.war</Set> " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "   <Set name=\"virtualHosts\">            " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "     <Array type=\"java.lang.String\">    " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "       <Item>$SERVIDOR_REQUISITOS</Item>  " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "     </Array>  " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo "   </Set> " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
echo " </Configure> " >>  ~/servidor/jetty9/webapps/$arqProjRequisito
fi


done


# Dropa o banco superCompras (comando temporario)
#mysqladmin processlist -u root superCompras | \
#awk '$2 ~ /^[0-9]/ {print "KILL "$2";"}' | \
#mysql -u root 
#mysqladmin -u root   drop superCompras -f

