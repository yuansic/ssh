cd /data/devweb01/applications/x-sso-server-web/bin
./setenv.sh
./shutdown.sh
ps -ef|grep x-sso-server-web|grep devweb01|grep -v grep|awk '{print $2}'|xargs  kill -9 
