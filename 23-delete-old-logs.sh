#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33"
B="\e[34"
N="\e[0"

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR does not exitst"
    exit 1
fi 



FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -type f -mtime +14)
# echo "$FILES_TO_DELETE"

while IFS= read -r filepath;
do 
    echo "Deleting file: $filepath"
    rm -f $filepath
    echo "Deleted file: $filepath"
    
done <<< $FILES_TO_DELETE    # here <<< for to read and get the varaible 
                            # if we use > to get the output


                            #if [ ! -d $LOGS_DIR ]; then
                            #   echo -e "$LOGS_DIR" DOES not EXITS
                            #   exit 1
                            # fi