#!/bin/sh


COMMON_LIB_HOME=$HOME/applications/balance-services
echo -----------------------------------------COMMON_LIB_HOME $COMMON_LIB_HOME
export COMMON_LIB_HOME

for file in ${COMMON_LIB_HOME}/libs/**/*.jar;
do CP=${CP}:$file;
done

CLASSPATH="${CP}"
export CLASSPATH
JAVA_HOME="/opt/jdk/jdk1.8.0_121"
export JAVA_HOME
JAVA_OPTIONS=" -Dfile.encoding=UTF-8  -Doracle.jdbc.V8Compatible=true -Dweblogic.ThreadPoolSize=50 -Dweblogic.ThreadPoolPercentSocketReaders=80 -Djava.net.preferIPv4Stack=true -Dsun.net.inetaddr.ttl=10 -DzkHost=172.16.13.121:39181 "
MEM_ARGS="-Xms128m -Xmx512m"
