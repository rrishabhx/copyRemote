#!/bin/bash
clear
echo -e "\e[1;34m*****Remote Copying process about to begin*****\e[0m\n"
sleep 2
#IP sheet should be provided as argument 1.
if [ ! -f "$1" ];then
  echo -e "IP sheet doesn't exist. Aborting process.....\n"
  sleep 2
  exit 1
else
  echo -e "IP sheet exists. Continuing process.....\n"
  sleep 2
fi


#Source file location should be given as argument 2.
if [ -f "$2" ] || [ -d "$2" ];then
  echo -e "Input file/folder exists. Continuing process.....\n"
  sleep 2

else
  echo -e "Input file/folder doesn't exist. Aborting process.....\n"
  sleep 2
  exit 1
fi

source_file="$2"
export source_file

#Give destination Copy path
read -p "Enter the Destination location (Directory path): " dest
export dest

#Copying data PAN India
echo -e "***Copying $2 to the remote servers***\n"
sleep 2
N=$(wc -l < "$1" )
for ((i=1;i<=$N;i++))
do
  ipc=$(awk "NR==$i" "$1")
  echo -e "\n\e[1;32mBlade IP = $ipc\e[0m"
  export ipc
  $(pwd)/scp_rzcopyremote.tcl
done

