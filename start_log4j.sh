#!/usr/bin/env bash

cd `dirname $0`

. ./inc.mk

java -classpath ".:$LOG4J_PATH/*:commons-collections-3.2.1/*" Log4jSocketServer
