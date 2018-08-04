cd /data/devweb01/applications/x-sso-server-web/bin
./setenv.sh
JAVA_OPTS="-Doracle.jdbc.V8Compatible=true $JAVA_OPTS"
JAVA_OPTS="-Dfile.encoding=UTF8 $JAVA_OPTS"
#JAVA_OPTS="-Ddisconf.conf=$HOME/ConfigBak/disconf/disconf-dvp-list-web.properties $JAVA_OPTS"
JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"
export JAVA_OPTS="-server -Xms512m -Xmx512m $JAVA_OPTS"
echo $JAVA_OPTS
./startup.sh

