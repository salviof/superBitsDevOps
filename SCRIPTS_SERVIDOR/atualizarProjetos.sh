

#Para cada pasta do servidor de git, projetos adiciona uma string no array projetos
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

source ~/superBitsDevOps/SCRIPTS_SERVIDOR/atualizarProjeto.sh $nomeProjeto


# Dropa o banco superCompras (comando temporario)
#mysqladmin processlist -u root superCompras | \
#awk '$2 ~ /^[0-9]/ {print "KILL "$2";"}' | \
#mysql -u root 
#mysqladmin -u root   drop superCompras -f

