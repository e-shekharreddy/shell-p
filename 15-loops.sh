#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-p"
LOGS_FILE="/var/log/shell-p/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access" | tee -a $LOGS_FILE
    exit 1
fi 

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2... FAILURE" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2... SUCCESS" | tee -a $LOGS_FILE
    fi
}
for package in $@ #sudo sh <file name> package names like nginx mysql nodejs
do 
        dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then 
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
         VALIDATE $? "$package installation" # here VALIDATE $1 $2 format
    else
        echo "$package already installed, skipping"
    fi
done