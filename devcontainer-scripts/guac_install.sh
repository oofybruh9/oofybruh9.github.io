#! /bin/sh
set -e
echo "http://dl-cdn.alpinelinux.org/alpine/v3.22/community" >> /etc/apk/repositories
apk update
apk add --no-cache guacamole-server guacamole-server-vnc guacamole-server-ssh guacamole-server-libs guacamole-server-encoder openjdk11-jre-headless wget
wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.11/bin/apache-tomcat-11.0.11.tar.gz
mkdir /opt/tomcat9
tar xvzf apache-tomcat-11.0.11.tar.gz --strip-components 1 --directory /opt/tomcat9
wget https://dlcdn.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war -O /opt/tomcat9/webapps/guacamole.war
cat << EOIDK >> /usr/local/share/start-vnc.sh
#! /bin/sh
vncserver :1 &
guacd -f &
/opt/tomcat9/bin/catalina.sh start  &

EOIDK
