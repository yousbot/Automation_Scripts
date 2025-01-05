#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

media_full_path=/tmp/was.repo.9000.ihs.zip
extraction_full_path=/tmp/IHS
im_path=/opt/IBM/IM
media_install_dir=/opt/IBM/HTTPServer
sdkmedia_full_path=/tmp/sdk.repo.8030.java8.linux.zip
sdkextraction_full_path=/tmp/SDK

#########################################################################

## Verify Media
if ! ls $media_full_path || ! ls $sdkmedia_full_path; then
	echo "Media Exist	:	[ Not ok ]	"
	exit;
fi
echo " Media Exist	:	[ ok ]	"

## Extract Media
mkdir -p $extraction_full_path
unzip $media_full_path -d $extraction_full_path

## If sdk is already extreacted, don't comment these lines.
mkdir -p $sdkextraction_full_path
unzip $sdkmedia_full_path -d $sdkextraction_full_path

## Launch Installation
media_id=$($im_path/eclipse/tools/imcl listAvailablePackages -repositories $extraction_full_path)
sdk_id=$($im_path/eclipse/tools/imcl listAvailablePackages -repositories $sdkextraction_full_path)
$im_path/eclipse/tools/imcl install $media_id $sdk_id -repositories $extraction_full_path,$sdkextraction_full_path  -installationDirectory $media_install_dir -acceptLicense -showProgress

