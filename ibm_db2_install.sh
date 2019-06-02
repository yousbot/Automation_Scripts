#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

media_full_path=/tmp/DB2Server.10.5.zip
extraction_full_path=/tmp/DB2

########################################################################

## Verify Media
if ! ls $media_full_path || ! ls $sdkmedia_full_path; then
	echo "Media Exist	:	[ Not ok ]	"
	exit;
fi
echo " Media Exist	:	[ ok ]	"

## Extract Media
#mkdir -p $extraction_full_path
#unzip $media_full_path -d $extraction_full_path

## Launch Installation
chmod -R u+x $extraction_full_path/DB2*/server/
$extraction_full_path/DB2_10.5/server/db2_install
