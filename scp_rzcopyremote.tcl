#!/usr/bin/expect
#Replace username with your username
spawn scp -o StrictHostKeyChecking=no -r $::env(source_file) USERNAME@$::env(ipc):$::env(dest)
expect "assword: "
#Enter password for the servers inside double quotes and  before '\r'  
#eg: send "mypassword\r"
#Write password below
send "----\r" 
interact
send_user "\n>>>>>>>>>>>>>>>>>>>>>>>>> Copied successfully to Remote server $::env(ipc) <<<<<<<<<<<<<<<<<<<<<<<<<\n"
