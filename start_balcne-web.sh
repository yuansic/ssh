cd $HOME/applications/balance-web/bin
#. setenv.sh
JAVA_OPTS="-Doracle.jdbc.V8Compatible=true $JAVA_OPTS"
JAVA_OPTS="-Dfile.encoding=UTF8 $JAVA_OPTS"
#JAVA_OPTS="-DzkHost=172.16.13.158:29181 -DzkTimeout=20000 $JAVA_OPTS"
export JAVA_OPTS="-server -Xms256m -Xmx512m -XX:PermSize=64M -XX:MaxPermSize=128m $JAVA_OPTS"
./startup.sh
