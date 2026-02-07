#!/bin?bash

# TIMESTAMP=$(date)

# echo "script executed at:$TIMESTAMP"

start_time=$(date +%s)

sleep 10

end_time=$(date +%s)

Total_time=$(($end_time - $start_time))

echo "Script executed $Total_time seconds"