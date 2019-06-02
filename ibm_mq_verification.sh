#!/bin/bash

. /opt/mqm/bin/setmqenv -s

echo " "; echo " ";
echo " ##	Create QMA " 
crtmqm QMA

echo " "; echo " ";
echo " ##	Start QMA " 
strmqm QMA

echo " "; echo " ";
echo " ##	Display Status " 
dspmq -m QMA

echo " "; echo " ";
echo " ##	Stopping QMA "
endmqm QMA

echo " "; echo " ";
echo " ##	Deleting QMA " 
dltmqm QMA
