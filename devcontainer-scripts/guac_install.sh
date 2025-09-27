#! /bin/sh
set -e
echo "http://dl-cdn.alpinelinux.org/alpine/v3.22/community" >> /etc/apk/repositories
apk update
apk add --no-cache guacamole-server guacamole-server-vnc guacamole-server-ssh guacamole-server-libs guacamole-server-encoder tomcat9
wget https://dlcdn.apache.org/guacamole/1.5.5/binary/guacamole-1.5.5.war -O /var/lib/tomcat9/webapps/guacamole.war
mkdir /etc/guacamole
cat << EOL >> /etc/guacamole/guacamole.properties
guacd-hostname: localhost
guacd-port: 4822

EOL
mkdir -p /usr/share/tomcat9/.guacamole
ln -s /etc/guacamole /usr/share/tomcat9/.guacamole
cat << EOIDK >> /usr/local/share/start-vnc.sh
vncserver :1 &
guacd -f
/usr/share/tomcat9/bin/catalina.sh start

EOIDK
echo "done with everything!"
