# dropboxLogUpload

The script runs at the beginning of every hour **when the computer is turned on**.

It takes the kernel log output from the last hour and stores it in a txt file.   

After that the file is compressed to a .tar.bz2 format.  

The compressed file is uploaded to dropbox and then both files are deleted from the local machine.


