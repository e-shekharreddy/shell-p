#!/bin/bash

NUMBER=$1

# -gt = greater than
# -lt = less than
# -eq = equal
# -ne = not equal

if [$NUMBER - gt 143]; then
echo "given number: $NUMBER greater than 143"
elif [$NUMBER -lt 143]; then
echo "given number: $NUMBER less than 143"
else 
echo "given number: $NUMBER equals to 143"
fi
