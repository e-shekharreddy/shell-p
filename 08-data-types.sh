#!/bin/bash
Num1=100
Num2=150

sum=$(($Num1 + $Num2))

echo "Sum of the numbers: $sum"

#array

Fruits=("apple" "banana" "mango" "orange")

echo "fruits are : ${Fruits[@]}"
echo "first fruit is :${Fruits[0]}"
echo "second fruit is :${Fruits[1]}"
echo "third fruit is :${Fruits[2]}"
echo "fourth fruit is :${Fruits[3]}"