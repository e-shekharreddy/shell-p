#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-p"
LOGS_FILE="/var/log/shell-p/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e " $R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi 

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2... $R FAILURE $N " | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2... $G SUCCESS $N " | tee -a $LOGS_FILE
    fi
}
for package in $@ #sudo sh <file name> package names like nginx mysql nodejs
do 
        dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then 
        echo -e "$package not installed, $B installing now $N "
        dnf install $package -y &>> $LOGS_FILE
         VALIDATE $? "$package installation" # here VALIDATE $1 $2 format
    else
        echo -e "$package already installed... $Y skipping $N"
    fi
done