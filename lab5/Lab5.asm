# Haofan Wang
# hwang108@ucsc.edu
# Lab5: Decimal to binary converter
# Due date 2/28/2018
# 01E TA: Carlos Espinosa

# pseudocode
# Read program argument string
# if the first char is not "-"
#	store the positive number into $s0
#	for(i = 0; i<32; i++){
#		use bitmask
#		use and $s0, $s0, storedNum
#		if $s0 is 0
#			prints out 0
#		if $s0 is 1
#			prints out 1
#		}
# if the first char is "-"
#	store the negative number into $s0
#	for(i = 0; i<32; i++){
#		use bitmask
#		use and $s0, $s0, storeNum
#		if $s0 is 0
#			prints out 0
#		if $s0 is 1
#			prints out 1
#			}

.data 
	input: .asciiz "User input number: \n"
	output: .asciiz "This number in binary is: \n"
	nextline: .asciiz "\n"
	
.text
	addi $t4, $zero, 32		# declare everything I need
	li $t5, 0x80000000
	li $t6, 0
	li $t7, 0
	li $t8, 1
	
	li $v0, 4			# ask for the input
	la $a0, input
	syscall
	
	lw $s0, ($a1)			# prints out the input
	li $v0, 4	
	move $a0, $s0
	syscall		
	
	addi $s1, $zero, 0		# declare s1 as deciaml 0
	addi $t3, $zero, 3		# declare t3 as deciaml 3
	
	lb $t2, ($s0)			# read the first char,if it's "-", branch
	beq $t2, 45, negative
	forloop0:
		lb $t0, ($s0)		# store the positive number
		sub $t0, $t0, 48
		add $s1, $s1, $t0
		addi $s0, $s0,1  
		lb $t1, ($s0)		
		beqz $t1, exitloop
		mul $s1, $s1, 10	
		b forloop0
	exitloop:
		li $v0, 4		# prints output
		la $a0, nextline
		syscall
		
		li $v0, 4
		la $a0, output
		syscall
		
	print:  beq $t4, $t6, exit	# a 32 times loop to prints out all 32 bits
		and $s0, $s1, $t5	# prints out the postive number in binary
		srl $t5, $t5, 1
		addi $t6,$t6,1
		beq $s0, $t7, print0
		li $v0, 1
		la $a0, ($t8)
		syscall
		b print
		print0:
		li $v0,1
		la $a0, ($t7)
		syscall
		b print
		exit:
		
		beq $t3, 3, jump	# skip negative operation
	
	negative:
	forloop1:
		addi $s0, $s0, 1	# store the negative numebr
		lb $t0, ($s0)
		sub $t0, $t0, 48
		sub $s1, $s1, $t0
		addi $s2, $s0,1  
		lb $t1, ($s2)		
		beqz $t1, exitloop1
		mul $s1, $s1, 10	
		b forloop1
	exitloop1:
		li $v0, 4		# prints output
		la $a0, nextline
		syscall
		
		li $v0, 4
		la $a0, output
		syscall
	print1: 			# prints 32 bits negative binary number
		beq $t4, $t6, exit1
		and $s0, $s1, $t5
		srl $t5, $t5, 1
		addi $t6,$t6,1
		beq $s0, $t7, print00
		li $v0, 1
		la $a0, ($t8)
		syscall
		b print
		print00:
		li $v0,1
		la $a0, ($t7)
		syscall
		b print
		exit1:
		
	jump:
		#li $v0,1		# prints output debug
		#move $a0, $s1
		#syscall
		
		li $v0, 10		# exit the program
		syscall
