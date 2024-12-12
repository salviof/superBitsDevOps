#!/bin/bash
echo "Nome do desenvolvedor $GIT_DESENVOLVEDOR_NOME"
echo "Email desenvolvedor $GIT_DESENVOLVEDOR_EMAIL" 
source  /home/superBits/superBitsDevOps/core/coreSBBash.sh
alerta "Personalizando estação pessoal de $GIT_DESENVOLVEDOR_NOME"
source  /home/superBits/superBitsDevOps/VARIAVEIS/SB_VARIAVEIS.sh
echo $GIT_REPOSITORIO_PROJETOS
git config --global user.name "$GIT_DESENVOLVEDOR_NOME"
git config --global user.email "$GIT_DESENVOLVEDOR_EMAIL"
git config --global user.password "$GIT_DESENVOLVEDOR_SENHA"
git config --global credential.helper store
WORKDIR /var/lib/jetty
EXPOSE 8080
/docker-entrypoint.sh java -jar /usr/local/jetty/start.jar


