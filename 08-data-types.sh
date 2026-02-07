#!/bin/bash
Num1=100
Num2=150

sum=$(($Num1 + $Num2))

echo "Sum of the numbers: $sum"

#array

Fruits=("apple" "banana" "mango" "orange")

echo "fruits are : $Fruits"
echo "first fruit is :$(Fruits(0))"