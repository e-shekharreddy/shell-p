#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi 

echo "installing Nginx"
dnf install nginxxxx -y 

if [ $? -ne 0 ]; then 
    echo "Installing Nginx ... FAILURE"
else 
    echo "Insatalling Nginx... SUCCESS"
fi

