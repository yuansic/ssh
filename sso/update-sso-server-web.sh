#!/bin/sh


echo  '---更新代码---'
cd $HOME/src/x-sso-server-web
#git reset --hard origin/develop
#git reset --hard origin/master
git pull
#git checkout  develop
#git checkout v_20180131
#git checkout  master
git pull
echo '---git update end-----'
echo '----开始编译-----'
gradle build -x check
echo '----编译结束----'
echo '----拷贝工程文件---'
rm -rf $HOME/applications/x-sso-server-web/webapps/x-sso-server-web.war
rm -rf $HOME/applications/x-sso-server-web/webapps/x-sso-server-web/
cp $HOME/src/x-sso-server-web/build/libs/x-sso-server-web.war  $HOME/applications/x-sso-server-web/webapps/
#cd $HOME/applications/x-sso-server-web/webapps/x-sso-server-web
#jar -xf x-sso-server-web.war
#rm -f x-sso-server-web.war
echo '---拷贝结束----'
echo '---拷贝备份文件--'
#cd  $HOME/applications/x-sso-server-web/
echo '---拷贝备份文件结束--'


