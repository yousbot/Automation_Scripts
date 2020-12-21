#!/bin/bash

##!! NOTE	:	THIS SCRIPT MUST BE EXECUSTED AS A DB2INST1 USER; OR CHANGE PERMISSIONS

################        ENVIRONMENT VARIABLES           ################

db2_inst_dir=/opt/ibm/db2/V10.5
db_name=test
db_buffer_name=test_buffer
tablespace_name=tstest
DB2_REPO=/db2repo

######################################################################

## DB2 REPO
mkdir $DB2_REPO

$db2_inst_dir/bin/db2 "ATTACH to db2inst1"
$db2_inst_dir/bin/db2 "CREATE DATABASE $db_name USING CODESET UTF-8 TERRITORY US"
$db2_inst_dir/bin/db2 "CONNECT TO $db_name"
$db2_inst_dir/bin/db2 "CREATE BUFFERPOOL $db_buffer_name PAGESIZE 4096"
$db2_inst_dir/bin/db2 "CREATE REGULAR TABLESPACE $tablespace_name PAGESIZE 4096 MANAGED BY DATABASE USING (file '$DB2_REPO/$db_buffer_name' 19200) EXTENTSIZE 16 OVERHEAD 10.5 PREFETCHSIZE 16 TRANSFERRATE 0.33 BUFFERPOOL $db_buffer_name DROPPED TABLE RECOVERY ON"
