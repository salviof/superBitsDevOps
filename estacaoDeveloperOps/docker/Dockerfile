FROM jetty:9.4-jdk8
LABEL maintainer="Salvio Furbino Elias <salviof@gmail.com>"
COPY arquivos/timezone /home/servidorSBFW/timezone
COPY arquivos/instalacao.sh /home/superBits/instalacao.sh
COPY arquivos/entryPointCJDeveloper.sh /bin/entryPointCJDeveloper.sh

#VOLUME /home/servidorSBFW/arquivosDeEntidade
USER root
RUN echo "Olá Mundo!"
RUN mkdir -p  /home/servidorSBFW/arquivosDeEntidade  && chgrp jetty /home/servidorSBFW/arquivosDeEntidade
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install maven -y
RUN apt-get install vim -y
RUN fc-cache -f -v
RUN echo "Alterando dono do diretório, para usuário Atual"
RUN git config --global credential.helper store
RUN sed -i 's/\r//g' /bin/entryPointCJDeveloper.sh
RUN mkdir /home/superBits -p
RUN ls /home/superBits
WORKDIR /home/superBits 
RUN git clone https://github.com/salviof/superBitsDevOps.git 
WORKDIR /home/superBits/superBitsDevOps 
RUN git pull
RUN /bin/bash -e /home/superBits/superBitsDevOps/dependenciasAplicativosBase.sh 
RUN /bin/bash -e /home/superBits/superBitsDevOps/baixarDependencias.sh 
WORKDIR /home/superBits/projetos/coletivoJava/source/integracao/intMatrixChat/
RUN ./dependenciaEmbarcada.sh
WORKDIR /home/superBits/superBitsDevOps
#RUN /bin/bash -e /home/superBits/superBitsDevOps/compilarTudo.sh
WORKDIR /home/superBits 

#RUN sed -i 's/\r//g' /home/superBits/instalacao.sh
#RUN /home/superBits/instalacao.sh
#RUN bash <(curl -s https://raw.githubusercontent.com/salviof/FWColetivoJava/refs/heads/master/instalacaoAutomatica.sh)
RUN  java -jar /home/servidorSBFW/timezone/tzupdater.jar -f -l file:///home/servidorSBFW/timezone/tzdata2024a.tar.gz
#RUN /bin/bash -e /home/superBits/instalacao.sh
EXPOSE 8080
#ENTRYPOINT ["/bin/entryPointCJDeveloper.sh"]
