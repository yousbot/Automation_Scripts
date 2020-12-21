#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

was_install_path=/opt/IBM/WAS/AppServer
HOST_NAME=$(hostname)
PROFILE_NAME=Profile1
NODE_NAME=$PROFILE_NAME'Node01' 
CELL_NAME=$NODE_NAME'Cell'
DMGR_HOST=localhost
DMGR_PORT=8879
DMGR_USER=wasadmin 
DMGR_PASSWORD=wasadmin 

#########################################################################


$was_install_path/bin/manageprofiles.sh -create \
-profileName $PROFILE_NAME  \
-profilePath $was_install_path/profiles/$PROFILE_NAME  \
-cellName $CELL_NAME \
-nodeName $NODE_NAME  \
-templatePath $was_install_path/profileTemplates/managed \
-hostName $(hostname -s) \
-dmgrHost $DMGR_HOST \
-dmgrPort $DMGR_PORT \
-dmgrAdminUserName $DMGR_USER \
-dmgrAdminPassword $DMGR_PASSWORD
