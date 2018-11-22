#!/bin/bash

clear

echo "Restart starting Netgear GS110TP ."

#echo -n "Enter IP address: "
#read switchIP

switchIP=192.168.6.201

echo -n "checking device online wih ping:" 
until ping -c1 $switchIP ; do :; done

echo -n "Switch Password: "
read switchPassword

echo -n "$switchIP"
echo ""
echo -n "$switchPassword"
echo ""

(sleep 1;echo admin;sleep 1;echo "$switchPassword";sleep 1;echo enable;sleep 1;echo "";sleep 1;echo reload;sleep 1;echo y;sleep 1;echo y;sleep 1) | telnet $switchIP 60000
echo -n "Waiting 5s before starting ping: "
sleep 5;
until ping -c1 $switchIP ; do :; done

echo -n "end script  \n"