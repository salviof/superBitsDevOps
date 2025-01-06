sudo systemctl start docker
sudo docker stop devopsTestes1
sudo docker rm devopsTestes1
sudo docker run -d  --volume /home/superBits/desenvolvedor/bancoDeDados/laudosFlinster:/devopsDBScript/:z  -e MYSQL_ROOT_PASSWORD='senhaDev#123' -e MYSQL_DATABASE='mydb' -e  MYSQL_ALLOW_EMPTY_PASSWORD='yes' -e MYSQL_PASSWORD='senhaDev#123' -e MYSQL_ROOT_HOST="%" -p 3306:3306 --name devopsTestes1  coletivo_java_devops:mysql57 
