#!/bin/bash

################        ENVIRONMENT VARIABLES           ################

was_install_path=/opt/IBM/WAS/AppServer
HOST_NAME=$(hostname)
PROFILE_NAME=DMGRLAB
NODE_NAME=$PROFILE_NAME'Node01' 
CELL_NAME=$NODE_NAME'Cell' 
DMGR_USER=wasadmin 
DMGR_PASSWORD=wasadmin 

########################################################################


$was_install_path/bin/manageprofiles.sh -create \
-profileName $PROFILE_NAME  \
-profilePath $was_install_path/profiles/$PROFILE_NAME  \
-cellName $CELL_NAME \
-nodeName $NODE_NAME  \
-templatePath $was_install_path/profileTemplates/management \
-serverType DEPLOYMENT_MANAGER  \
-hostName $HOST_NAME \
-enableAdminSecurity true \
-adminUserName $DMGR_USER \
-adminPassword $DMGR_PASSWORD
