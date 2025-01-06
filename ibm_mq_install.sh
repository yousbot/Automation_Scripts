#!/bin/bash

################	ENVIRONMENT VARIABLES		################

media_full_path=/tmp/IBM_MQ_9.1.1_LINUX_X86-64.tar.gz
extraction_full_path=/tmp/IBM_MQ_9.1.1_LINUX_X86-64
mq_bin_path=

#########################################################


groupadd mqm
useradd mqm -g mqm
mkdir -p $extraction_full_path
tar -xvf $media_full_path -C $extraction_full_path
$extraction_full_path/MQServer/mqlicense.sh -accept
rpm -ivh $extraction_full_path/MQServer/MQSeries*.rpm


echo " "; echo " "; echo " ";
echo " Installation Finished ! " ; echo " ";
. /opt/mqm/bin/setmqenv -s
dspmqver

echo " "; echo " "; echo " ";
