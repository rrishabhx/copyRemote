#!/bin/bash
clear
echo -e "\e[1;34m+++++++++++++++++++++++++++++++++++++++++++++++++++++\e[0m"
echo -e "\e[1;34m -----> REMOTE COPYING PROCESS ABOUT TO BEGIN ----->\e[0m"
echo -e "\e[1;34m+++++++++++++++++++++++++++++++++++++++++++++++++++++\e[0m\n"
sleep 1
#IP sheet should be provided as argument 1.
if [ ! -f "$1" ];then
  echo -e "\e[1;31mIP sheet doesn't exist. Aborting process.....\e[0m\n"
  sleep 1
  exit 1
else
  echo -e "\e[1;32mIP sheet exists. Continuing process.....\e[0m\n"
  sleep 1
fi


#Source file location should be given as argument 2.
if [ -f "$2" ] || [ -d "$2" ];then
  echo -e "\e[1;32mInput file/folder exists. Continuing process.....\e[0m\n"
  sleep 1

else
  echo -e "\e[1;31mInput file/folder doesn't exist. Aborting process.....\e[0m\n"
  sleep 1
  exit 1
fi

source_file="$2"
export source_file

#Give destination Copy path
echo -en "\e[1;34mEnter the Destination location (Directory path): \e[0m" 
read dest
export dest

#Copying data PAN India
echo -e "\n***Copying $2 to the remote servers***\n"
sleep 1
N=$(wc -l < "$1" )
echo -en "\n\e[1;34mEnter Username: \e[0m"
read username
echo -en "\e[1;34mEnter Password: \e[0m"
read -s password
echo
for ((i=1;i<=$N;i++))
do
  ipc=$(awk "NR==$i" "$1")
  echo -e "\n\e[1;32mBlade IP = $ipc\e[0m"
  export ipc
  $(pwd)/scp_rzcopyremote.tcl $username $password
done
