#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi 

echo "installing Nginx"
dnf install nginx -y 

if [ $? -ne 0 ]; then 
    echo "Installing Nginx... FAILURE"
    exit 1
else 
    echo "Insatalling Nginx... SUCCESS"
fi

dnf install mysql -y 

if [ $? -ne 0 ]; then 
    echo "Installing MySql... FAILURE"
    exit 1
else 
    echo "Insatalling MySql... SUCCESS"
fi

dnf install nodejs -y 

if [ $? -ne 0 ]; then 
    echo "Installing NodeJS... FAILURE"
    exit 1
else 
    echo "Insatalling NodeJS... SUCCESS"
fi