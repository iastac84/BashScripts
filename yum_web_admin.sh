#!/bin/bash

# Script to allow web_admin users perform some yum checks
# Usage ./yum_web_admin.sh <action> <package>
# check-updates: no package to specify
# check-installed: Please specify a package name
# check-available: Please specify a package name

# Variables : script inputs
ARG1=$1
ARG2=$2
YUM=/usr/bin/yum
DIR=/home/istacey/scripts/log

# Body

date > $DIR/yum_web_admin.log
echo "" >> $DIR/yum_web_admin.log

if [ "$ARG1" = "check-updates" ] ; then
        $YUM check-update >> $DIR/yum_web_admin.log
        YUM_RESULT=$?
        echo $YUM_RESULT
                case $YUM_RESULT in
                        100)
                                echo "Updates available"
                                exit 111
                                ;;
                        0)
                                echo "No Updates available!"
                                exit 112
                                ;;
                        1)
                                echo "ERROR!"
                                ext 113
                                ;;
                esac

elif [ "$ARG1" = "check-installed" ] ; then
        $YUM list --installed $ARG2 >> $DIR/yum_web_admin.log
        YUM_RESULT=$?
        echo $YUM_RESULT
                case $YUM_RESULT in
                        0)
                                echo "Package $ARG2 is installed!"
                                exit 114
                                ;;
                        1)
                                echo "Package $ARG2 is NOT installed!"
                                exit 115
                                ;;
                esac

elif [ "$ARG1" = "check-available" ] ; then
        $YUM list --available $ARG2 >> $DIR/yum_web_admin.log
        YUM_RESULT=$?
        echo $YUM_RESULT
                case $YUM_RESULT in
                        0)
                                echo "Package $ARG2 is available!"
                                exit 116
                                ;;
                        1)
                                echo "Package $ARG2 is NOT available in the current repos or does not exist!"
                                exit 117
                                ;;
                esac

else
        echo "INVALID Options. Specify one of the following:"
        echo "check-updates: no package to specify"
        echo "check-installed: Please specify a package name"
        echo "check-available: Please specify a package name"
        exit 118
fi
exit 222
