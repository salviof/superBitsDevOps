FROM jetty:9.4-jdk8
LABEL maintainer="Salvio Furbino Elias <salviof@gmail.com>"
COPY arquivos/timezone /home/servidorSBFW/timezone
#VOLUME /home/servidorSBFW/arquivosDeEntidade
USER root
RUN mkdir -p  /home/servidorSBFW/arquivosDeEntidade  && chgrp jetty /home/servidorSBFW/arquivosDeEntidade
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install maven -y
RUN apt-get install vim -y
RUN echo "Alterando dono do diretório, para usuário Atual"
RUN git config --global credential.helper store
COPY arquivos/instalacao.sh /home/superBits/instalacao.sh
#RUN /home/superBits/instalacao.sh
#RUN bash <(curl -s https://raw.githubusercontent.com/salviof/FWColetivoJava/refs/heads/master/instalacaoAutomatica.sh)
RUN  java -jar /home/servidorSBFW/timezone/tzupdater.jar -f -l file:///home/servidorSBFW/timezone/tzdata2024a.tar.gz
RUN fc-cache -f -v
COPY arquivos/entryPointCJDeveloper.sh /bin/entryPointCJDeveloper.sh

RUN sed -i 's/\r//g' /bin/entryPointCJDeveloper.sh
RUN sed -i 's/\r//g' /home/superBits/instalacao.sh
EXPOSE 8080
#ENTRYPOINT ["/bin/entryPointCJDeveloper.sh"]


