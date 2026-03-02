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
DAY=${3: -14} #14 days default value if user does not provide 

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi 

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R USAGE: sudo backup <source_dir> <dest_dir> <day[default 14 days] $N"
    exit 1
} 

if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then 
    echo -e "$R SOURCE_DIR does not exist $N"
    exit1 1
fi

if [ ! -d $DEST_DIR ]; then
    echo -e "$R DEST_DIR does not exist $N"
    exit 1
fi

