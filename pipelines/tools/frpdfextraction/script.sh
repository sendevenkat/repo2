#!/bin/bash
/usr/sbin/cron -f &

# Start the ClamAV daemon
crontab -l -u frpdfextraction-service
ls
if [ ! -f /opt/frpdfextraction-service/test.log ]
then
    echo "File does not exist in Bash"
    
else
    echo "File found. Do something meaningful here"
    tail -f /opt/frpdfextraction-service/test.log
fi

nc -lvnk 8080
