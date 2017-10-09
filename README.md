# copyRemote
## Automation tool to copy data to multiple servers 

This tool uses bash and expect scripts to copy data to multiple servers answering all password prompts automatically.

***Note: All destination servers must have same user-name and password.***
### Procedure to use: 
1. Enter IP addresses of the destination servers in the **ipSheet.txt** file.
2. Run: `./rzcopyremote.sh ipSheet.txt <File/Folder>`
