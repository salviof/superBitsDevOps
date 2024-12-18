FROM mysql:5.7
MAINTAINER Salvio Furbino <salviof@gmail.com>
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#RUN fc-cache -f -v
#COPY /devopsDBScript/
EXPOSE 3306
