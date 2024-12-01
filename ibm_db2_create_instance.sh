#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

db2_install_dir=/opt/ibm/db2/V10.5

#########################################################################

## Change ownership of install dir
chmod -R u+x $db2_install_dir

## Create groups and users
groupadd db2grp1
groupadd dasadm1
groupadd db2fgrp1
useradd -g db2grp1 -G dasadm1 -m db2inst1
passwd db2inst1
useradd -g dasadm1 -G db2grp1 -m dasusr1
passwd dasusr1
useradd -g db2fgrp1 -m db2fenc1
passwd db2fenc1

## Create DAS
$db2_install_dir/instance/dascrt -u dasusr1

## Create Instance
$db2_install_dir/instance/db2icrt -u db2fenc1 db2inst1

su - db2inst1 -c "db2set DB2COMM=tcpip"
su - db2inst1 -c "db2 update dbm cfg using SVCENAME 50000"
su - db2inst1 -c "$db2_install_dir/adm/db2start"

# Dummy comment 2
