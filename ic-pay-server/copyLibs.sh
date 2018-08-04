#!/bin/sh

SRC_BASIC_BUILD_HOME=${HOME}/src/ic-pay-server/build
SRC_CONFIG_HOME=${SRC_BASIC_BUILD_HOME}/config
SRC_HOME_LIB=${SRC_BASIC_BUILD_HOME}/libs
TARGET_HOME=${HOME}/applications/pay-services/


echo $SRC_HOME_LIB
echo $TARGET_HOME

echo "delete old"
cd $TARGET_HOME
rm -f libs/3rd-libs/*
rm -f libs/core-libs/*
echo "delete old config"
rm -rf config/*

echo "copy new"
cp $SRC_HOME_LIB/3rd-libs/* libs/3rd-libs
cp $SRC_HOME_LIB/core-libs/* libs/core-libs

#echo "delete pay-api*.jar"
#rm -rf  $TARGET_HOME/libs/core-libs/pay-api*

echo "copy new config"
cp -r  $SRC_CONFIG_HOME/* config/

echo "ok"
