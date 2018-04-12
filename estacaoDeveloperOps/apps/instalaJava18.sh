
sudo mkdir -p /home/superBits/developer
cd /home/superBits/developer
sudo wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm" \
-O jdk-7-linux-x64.rpm
sudo yum install jdk-7-linux-x64.rpm

sudo alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_79/bin/java 2
sudo alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_79/bin/javac 2
sudo alternatives --install /usr/bin/java javaws /usr/java/jdk1.7.0_79/bin/javaws 2
sudo alternatives --install /usr/bin/jar jar /usr/java/jdk1.7.0_79/bin/jar 2
sudo alternatives --config java
sudo alternatives --config javac
sudo alternatives --config javaws
sudo alternatives --config jar
sudo java -version 

