#!/bin/bash

#To run this script include a ./ before the file name
#This script searches for which ip addresses have been given out by the DHCP server on the network, input the numbers corresponding to the subnet mask as a sys argument

if [ "$1" == "" ]
then
echo "please enter an IP address!"
echo "Syntax: ./ipsweep.sh 11.20.7"

else
for ip in `seq 1 254`; do
#Using the & instead of ; after all the below commands runs multiple instances of the loop at the same time instead of one at a time
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi
