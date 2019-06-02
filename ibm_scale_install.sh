#!/bin/bash

echo " "; echo " ";

##########		Environment Variables		##########

media_full_path=/tmp/Scale_adv_install-5.0.2.0_x86_64.tar
extraction_full_path=/tmp/Scale_adv_install-5.0.2.0
ksh_full_path=/tmp/ksh-20120801-137.el7.x86_64.rpm
gpfs_install_path=/usr/lpp/mmfs/5.0.2.0/gpfs_rpms/
gpfs_bin_path=/usr/lpp/mmfs/bin

##################################################################

mkdir -p $extraction_full_path
tar -xvf $media_full_path -C $extraction_full_path
$extraction_full_path/Spectrum_Scale_*-x86_64-Linux-install --silent
rpm -ivh $ksh_full_path


yum install ksh
yum install kerne-devel
yum install kernel-devel
yum install c++
yum install kernel-headers
yum install cpp
yum install gcc-c++

rpm -ivh $gpfs_install_path/gpfs.base-5.0.2-0.x86_64.rpm 
rpm -ivh $gpfs_install_path/gpfs.gpl-5.0.2-0.noarch.rpm 
rpm -ivh $gpfs_install_path/gpfs.license.adv-5.0.2-0.x86_64.rpm 
rpm -ivh $gpfs_install_path/gpfs.compression-5.0.2-0.x86_64.rpm 
rpm -ivh $gpfs_install_path/gpfs.gskit-8.0.50-86.x86_64.rpm 
rpm -ivh $gpfs_install_path/gpfs.msg.en_US-5.0.2-0.noarch.rpm 
rpm -ivh $gpfs_install_path/gpfs.docs-5.0.2-0.noarch.rpm

$gpfs_bin_path/mmbuildgpl

clear

echo " "; echo " "; echo " ";

echo " GPFS Has been installed successfully " ; echo " ";

echo " ## Add PATH=\$PATH:/usr/lpp/mmfs/bin to ~/.bash_profile "
echo " ## Source bash_profile using ( . ~/.bash_profile ) "
 
echo " "; echo " ";
