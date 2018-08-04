echo  '---更新代码---'
cd $HOME/src/balance-web
#git reset --hard origin/develop
#git reset --hard origin/master
gradle clean
git pull
#git checkout  master
echo '---git update end-----'
gradle clean
echo '----开始编译-----'
gradle build -x check
echo '----编译结束----'
echo '----拷贝工程文件---'
cp $HOME/src/balance-web/build/libs/balance-web.war  $HOME/applications/balance-web/webapps/balance-web
cd $HOME/applications/balance-web/webapps/balance-web
jar -xf balance-web.war
rm -f balance-web.war
echo '---拷贝结束----'
echo '---拷贝备份文件--'
#cp $HOME/ConfigBak/icrm-web/jdbc.properties  $HOME/applications/icrm-web/webapps/icrm-web/WEB-INF/classes/context/
cd  $HOME/applications/balance-web/
#find . -name 'log4j2.xml'|xargs sed -i 's/debug/error/g'
echo '---拷贝备份文件结束--'
