#!/usr/bin/expect
spawn ssh root@172.16.8.28
expect "*password*"
send "sy#TN586\r"
expect "*#"
interact
