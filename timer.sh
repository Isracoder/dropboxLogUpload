#!/bin/bash

#setup file name
fileDate=`date +%F`
fileTime=`date +%H-%M`
file="kernel-logs-$fileDate T$fileTime"
fileName="$(echo "$file" | tr -d ' ' )"

#testing to make sure fileName format is correct
#printf '\n'"$fileName" >> testfile.txt
#printf '\n'"$fileName.txt" >> testfile.txt
#printf '\n'"$fileName.tar.bz2" >> testfile.txt



#adding the logs to the text file and creating it
journalctl --since "1 hour ago" > "$fileName.txt"

#compressing it 
tar -cjf "$fileName.tar.bz2" "$fileName.txt"

fullCompressed="$fileName.tar.bz2" 

#uploading the compressed file
/home/isra/bin/dbxcli put "/home/isra/Documents/timertest/$fullCompressed" /logs/"$fullCompressed"

#removing text file
rm -f kernel*

