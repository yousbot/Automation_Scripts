#!/bin/bash


################        ENVIRONMENT VARIABLES           ################

media_full_path=/tmp/apm_advanced_8.1.4.0.tar
extraction_full_path=/tmp/apm
apm_install_dir=/opt/ibm/apm

########################################################################

## Verify Media
if ! ls $media_full_path || ! ls $sdkmedia_full_path; then
        echo "Media Exist       :       [ Not ok ]      "
        exit;
fi
echo " Media Exist      :       [ ok ]  "

if ! grep "SELINUX=disabled" /etc/selinux/config; then
	echo " You must set SELINUX=disabled on /etc/selinux/config "
	exit;
fi

## Extract Media
mkdir -p $extraction_full_path
tar -xvf $media_full_path -C $extraction_full_path

## Launch Installation

umask 0022
mkdir -p $apm_install_dir
export SKIP_PRECHECK=1
$extraction_full_path/install.sh -d $apm_install_dir -v
