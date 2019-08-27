Haofan Wang
hwang108@ucsc.edu
lab4: DEADBEEF in MIPS
Due date 2/16/2018
01E TA: Carlos Espinosa

Magic number: 9671, 0x1224, 3333

I learned how to code add, divide, reminder operation in MIPS. Also learned to
code if statement and while, for loop. I want to use else statement, but I can't
think of any, so I just go through all the conditions. 

1,The program fails before the number 2,147,483,647 (hexadecimal 7FFF,FFFF). The space of the registers determine this limit.

2,The range of the address is 20.

3, move, li, la, bgt, beq
	move $t, $s in mips is add $t, $s, 0 which is t = s
	li $t, C (to load 32 - bit immediate). lui $t, c_hi then ori $t,$t, C_lo in mips.
	la $t, A means t = A
	bgt $s, $t, C means branch if $s is greater than $t
	beq $s, $t, C means branch if $s is greater than or equal to $t

4,I used 7 registers when writing this program, I can use fewer register but I'm lazy to change. I can change my for loop from 
1 to N, write "when $t1(i) is equal to $t0(input) print without change line(\n)" so there will be no extra line at the end of 
the output. I will use 1 less register if I code this way. 
