#!/bin/bash

NUMBER=$1

# -gt = greater than
# -lt = less than
# -eq = equal
# -ne = not equal

if [$NUMBER - gt 143]
echo "given number greater than 143"
# elif [$NUMBER -lt 143]
# echo "given number less than 143"
else [$NUMBER -eq 143]
echo "given number equals to 143"
fi