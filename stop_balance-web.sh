cd $HOME/applications/balance-web/bin
#. setenv.sh
./shutdown.sh
ps -ef|grep balance-web|grep devweb01|grep -v grep|awk '{print $2}'|xargs  kill -9

