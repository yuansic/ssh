#!/bin/sh

DUBBO_PORT="20880"
APPFRAME_RAC_SERVER_NAME="PAY-SERVER"
PROCESS_NAME="DubboServiceStart"
PROCESS_PARM="resources.dubbo.protocol.port=$DUBBO_PORT"
CUR_USER=`whoami`
CENTER_NAME=pay-services
PRODUCT_CENTER_BASE_PATH=${HOME}/applications/pay-services
PRODUCT_CENTER_CONFIG_PATH=${PRODUCT_CENTER_BASE_PATH}/config

if [ "$1" = "start" ]; then
        PROCESS_ALIVE_STATUS=$($HOME/sbin/monitor_process.sh $PROCESS_NAME $PROCESS_PARM)
        if [ "$PROCESS_ALIVE_STATUS" = "PROCESS_EXIST" ];
        then
        echo " ibss resources center dubbo server had already started!! process param is [$PROCESS_PARM]"
        exit 0;
        fi

	source "${HOME}/bin/ic-pay-server/setEnv.sh"
        CLASSPATH="${CLASSPATH}:${PRODUCT_CENTER_CONFIG_PATH}"
        echo '--CLASSPATH--'
	echo ${CLASSPATH}
        #MEM_ARGS="-Xms1024m -Xmx1024m -XX:PermSize=512M -XX:MaxPermSize=1024M"
        
	MEM_ARGS="-Xms256m -Xmx512m -XX:PermSize=64M -XX:MaxPermSize=128M"
	java ${MEM_ARGS} -Dappframe.server.name=$APPFRAME_RAC_SERVER_NAME -Dresources.dubbo.protocol.port=$DUBBO_PORT  ${JAVA_OPTIONS} com.x.sdk.appserver.DubboServiceStart ${CENTER_NAME} >> $HOME/logs/pay-center-dubbo-$DUBBO_PORT.log& 2>&1&
        echo "ibss resources center dubbo server started!! process param is [$PROCESS_PARM].logs at $HOME/logs/pay-center-dubbo-$DUBBO_PORT.log"
else if [ "$1" = "stop" ]; then
        PROCESS_NUMBER=0
        ps -ef|grep $PROCESS_NAME |grep ${CUR_USER} | grep $PROCESS_PARM | grep java | grep -v grep | awk '{print $2}' |while read pid
        do
        PROCESS_NUMBER++
        kill ${pid} 2>&1 >/dev/null
        echo "stopped ibss resources center dubbo server process name :${PROCESS_NAME},process param:${PROCESS_PARM},PID:${pid} "
        done
        if [ "$PROCESS_NUMBER" = 0 ];
        then
                echo "ibss resources center dubbo server not exists. process name :${PROCESS_NAME},process param:${PROCESS_PARM}"
        fi
        exit 0;
else if [ "$1" = "monitor" ]; then
        PROCESS_ALIVE_STATUS=$($HOME/sbin/monitor_process.sh $PROCESS_NAME $PROCESS_PARM)
        if [ "$PROCESS_ALIVE_STATUS" = "PROCESS_EXIST" ];
        then
        echo "ibss resources center dubbo server started!! process param is [$PROCESS_PARM]"
        exit 0;
        else
                echo "ibss resources center dubbo server not exists. process name :${PROCESS_NAME},process param:${PROCESS_PARM}"
                exit 0;
        fi
else
                        echo "ERROR: Please input a correct argument,such as: start or stop or monitor"
        exit 1
fi
fi
fi

