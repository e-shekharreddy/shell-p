#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3
ALERT_TYPE=$4
SEVER_IP=$5
TO_TEAM=$6


FINAL_MESSAGE=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/SEVER_IP/$SERVER_IP/g" -e "s/MESSAGE/$MESSAGE/g" template.html)  # if we put sed -i that is permanet change so dont use -i here and -e is expression

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"