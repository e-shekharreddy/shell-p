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

done < 23-delete-old-logs.sh  #which fileto read


while IFS= read -r filepath;
do 
    echo "$filepath"
done <<< $FILE_TO_DELETE    # here <<< for to read and get the varaible 
                            # if we use > to get the output
                            