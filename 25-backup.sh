#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-p"
LOGS_FILE="/var/log/shell-p/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N"
    exit 1
fi 

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R USAGE:: sudo backup <source_dir> <dest_dir> <day[default 14 days] $N"
    exit 1
} 

if [ $# -lt 2 ]; then
    USAGE
fi
