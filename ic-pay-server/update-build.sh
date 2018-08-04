#!/bin/sh

cd ~/src/ic-pay-server
gradle clean
git pull
gradle clean
gradle build -x test -x check
