#!/bin/sh

cd ~/src/balance-server/slp-balance
gradle clean
rm -rf balance-core/balance-center*.cache balance-core/balance-center*.cache.lock
git pull
gradle clean
gradle build -x test -x check
