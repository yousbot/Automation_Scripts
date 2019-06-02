#!/bin/bash


hostname_f=$(hostname -f)
hostname_s=$(hostname -s)
ip=$(ifconfig -a | head -2 | tail -1 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -1)
timezone=$(timedatectl | grep "Time zone")
dat=$(date)
firewall=$(systemctl status firewalld | grep Active)
selinux=$(cat /etc/selinux/config | grep ^SELINUX= |cut -f2 -d'=')


echo " "; echo " ";
echo " ## Full Hostname			:	$hostname_f " 
echo " ## Short Hostname			:	$hostname_s "
echo " ## IP Adress     			:	$ip"
echo " ## List Host File			:	" ;

echo " "; echo " ---------	HOST FILE	------- "; echo " "

tput setaf 1; cat /etc/hosts;tput sgr0;

echo " "; echo " -------------------------------------- "; echo " "

## Check DNS
echo " ## List DNS Server		:	";

echo " "; echo " ---------	DNS SERVER	------- "; echo " "

tput setaf 1; cat /etc/resolv.conf;tput sgr0;

echo " "; echo " -------------------------------------- "; echo " "

a=" ## Verify DNS Server			: "  
           
if echo "$(nslookup $(hostname))" | grep -q "can"
then
	echo "$a	NOT OK " 
else
	echo "$a	OK " 
fi

echo " ## Check Timezone			:$timezone "
echo " ## Check Current Date			:	$dat      "
echo " ## Check SELINUX Status 			:	$selinux  "
echo " ## Check Space Info			:	"; 

echo " "; echo " ---------      SPACE INFO      ------- "; echo " "
tput setaf 1; df -h | grep -v "tmp";tput sgr0; 
echo " "; echo " -------------------------------------- "; echo " "

echo " ## Check Firewall Status		:	$firewall "




echo " "; echo " ";
