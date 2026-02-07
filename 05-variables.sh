#!/bin/bash

echo "please enter user name::"
read USER_NAME

echo "User name is $USER_NAME"

echo "please enter password::"
read -e PASSWORD # -e is for to hide the password 

read "password is $PASSWORD" #to see what password we enter
