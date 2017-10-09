#!/usr/bin/expect
set username [lindex $argv 0]
set password [lindex $argv 1]
spawn scp -o StrictHostKeyChecking=no -r $::env(source_file) $username@$::env(ipc):$::env(dest)
expect "assword: "
send "$password\r" 
interact
send_user "\n>>>>>>>>>>>>>>>>>>>>>>>>> Copied successfully to Remote server $::env(ipc) <<<<<<<<<<<<<<<<<<<<<<<<<\n"
