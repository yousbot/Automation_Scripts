#!/bin/bash

## This script aims to install the Installation Manager

################        ENVIRONMENT VARIABLES           ################

media_full_path=/tmp/agent.installer.lnx.gtk.x86_64_1.8.5.zip
extraction_full_path=/tmp/IM
shared_path=/opt/IBM/Shared
install_path=/opt/IBM/IM

#########################################################################

echo " "; echo " ";

mkdir -p $extraction_full_path
mkdir -p $shared_path
unzip $media_full_path -d $extraction_full_path
$extraction_full_path/groupinstc -dataLocation $shared_path -installationDirectory $install_path -acceptLicense -showProgress

echo " "; echo " ";


