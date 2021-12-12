#!/usr/bin/env bash

pid=`ps -e | grep java | awk '{print $1}'`
[[ "$pid" == "" ]] && echo "process not found" && exit

sudo strace -f -p $pid 2>&1 | grep -v "futex\|getrusage" | grep --color=always -C 5 "execve\|touch"
#sudo strace -f -p `ps auxw | grep java | grep "sh.*classpath.*Log4jSocketServer" | awk '{print $2}'` 2>&1 | grep -v "futex\|getrusage"
