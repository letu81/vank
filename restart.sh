netstat -apn |grep :3000 |grep -v grep|awk '{print $7}' |awk -F '/' '{print $1}' |xargs kill -9
rails s -b 192.168.1.126