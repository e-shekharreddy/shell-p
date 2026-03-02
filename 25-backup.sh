#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-p"
LOGS_FILE="/var/log/shell-p/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #14 days default value if user does not provide 

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi 

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R USAGE: sudo backup <source_dir> <dest_dir> <day[default 14 days] $N"
    exit 1
} 
log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}
if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then 
    echo -e "$R Source directory: SOURCE_DIR does not exist $N"
    exit1 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination directory: DEST_DIR does not exist $N"
    exit 1
fi

# find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then
    log "No files to archieve... $Y SKIPPING $N"
else 
    # app-logs- $timrstamp.zip
    log "FIles found to archieve: $FILES"
    TIME_STAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo "Archieve name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | tar -zcvf $ZIP_FILE_NAME

    # Check archieve is success or not 
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archieve is .... $G SUCCESS $N"
        
            while IFS= read -r filepath;
            do 
            echo "Deleting file: $filepath"
            rm -f $filepath
            echo "Deleted file: $filepath"
    
            done <<< $FILES

    else
        log "Archieve is .... $R FAILUR $N"
        exit 1
    fi 
fi

