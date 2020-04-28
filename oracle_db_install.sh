#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

media_full_path=/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm
preinstall_full_path=/tmp/oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm

########################################################################

## Verify Media
if ! ls $media_full_path || $preinstall_full_path; then
        echo "Media Exist       :       [ Not ok ]      "
        exit;
fi
echo " Media Exist      :       [ ok ]  "

## Launch Installation
yum install -y $preinstall_full_path
yum -y localinstall $media_full_path
/etc/init.d/oracle-xe-18c configure
chkconfig oracle-xe-18c on
service oracle-xe-18c start
