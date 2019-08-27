Haofan Wang
hwang108@ucsc.edu
Lab5: Decimal to binary converter
Due date 2/16/2018
01E TA: Carlos Espinosa

Magic number: 0x0745 3333 0123

I learned that the number stored in Mars is already in binary form.
When convert ASCII to decimal, I need to subtract 48 to get that number in decimal.
I learned how to use bitmasking to prints out binary number from mars.
I learned how to use mutiple for loop and if statements.

1, If the input number is too big, the program will lose information.
2, If the input number is too small, the program will also lose information.
3, Multu will ignore the overflow, mult will not.
4, I would read the first char
	if the first char is 0
		save the positive number by multply 2 since it's binary
		use bitmisking
		if the next char is 1 
			times 2 for every loop
		if the next char is 0
			ignore 
	if the first char is 1
		save the negative number by multply 2 since it's binary
		use bitmasking
		if the next char is 1
			ignore
		if the next char is 0
			times 2 for every loop

The logic are the same.Both can use bitmasking to print out.
The difference is that BDC times 2 when shifting,
DBC times 10 when shifting. 
