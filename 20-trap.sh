#!/bin/bash

set -e #this is used for checking error, if find it will exit
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND" ' ERR
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


for package in $@ #sudo sh <file name> package names like nginx mysql nodejs
do 
        dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then 
        echo -e "$package not installed, $B installing now $N "
        dnf install $package -y &>> $LOGS_FILE
    else
        echo -e "$package already installed... $Y skipping $N"
    fi
done