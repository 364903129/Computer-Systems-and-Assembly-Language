# Haofan Wang
# hwang108@ucsc.edu
# Lab7: Floating Point Calculations
# Due date 3/16/2018
# 01E TA: Carlos Espinosa

I learned the first bit is sign(0 is positive number and 1 is negative number).
Next 8 bits are the exponents, and rest of the bits are the significant. I can use 
these to convert it to binary or decimal, and do operations like adding, subtracting, multiplying, dividing. 

1, The largest number is 0x7FFFFFFF, 3.40262*10^38 in decimal.
2, Because 2SC needs to do integer comparison, and IEEE 745 SP does not. 
3, FL_Add
	num1 = first number;
	num2 = second number;
	convert to binary(num1)
	convert to binary(num2)
	if the first bit of num1 is 0
		num1 is positive
	else
		num1 is negative
	if the first bit of num2 is 0
		num2 is positive
	else
		num2 is negative
	take the next 8 bits and convert to decimal then subtract 127 to get exponents
	if both num's exponents are the same
		result = num1 + num2
	if both num's exponents are not the same
		convert the num with smaller exponents to the larger num
		result = num1 + num2
	if the result is positive
		the first bit is 0
	if the result is negative
		the first bit is 1
	take the exponent and convert it to 8 bits binary number
		then write down the last 23 bits of result 

FL_mult
	num1 = first number;
	num2 = second number;
	convert to binary(num1)
	convert to binary(num2)
	if the first bit of num1 is 0
		num1 is positive
	else
		num1 is negative
	if the first bit of num2 is 0
		num2 is positive
	else
		num2 is negative
	take the next 8 bits and convert to decimal then subtract 127 to get exponents
	add the exponents of two nums 
	result is num1 * num2
	if both num have same sign
		the first bit is 0
	else
		the first bit is 1
	take the exponent and convert it to 8 bits binary number
		then write down the last 23 bits of result 