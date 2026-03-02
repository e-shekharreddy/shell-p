#!/bin/bash

# count=1
# while [ $count -lt 6 ]
# do
#     echo "Count is $count"

#     sleep 1 
#     #increment count
#     ((count++))
# done 

while IFS= read -r line;  #IFS = internal field separator
do
    #process each line 
    echo "$line"

done < 23-delete_old_logs.sh  #which fileto read