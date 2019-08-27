# Haofan Wang
# hwang108@ucsc.edu
# Lab4: DEADBEEF in MIPS
# Due date 2/16/2018
# 01E TA: Carlos Espinosa

.data
	input: .asciiz "Please enter a number N: "
	Dead: .asciiz "DEAD\n"
	Beef: .asciiz "BEEF\n"
	DeadBeef : .asciiz "DEADBEEF\n"
	Dead1: .asciiz "DEAD"
	Beef1: .asciiz "BEEF"
	DeadBeef1: .asciiz "DEADBEEF"
	space: .asciiz "\n"
	
.text
	#conditions
	addi $t2, $zero, 4
	addi $t3, $zero, 9
	addi $t4, $zero, 36
	
	# ask user for the input
	li $v0, 4
	la $a0, input
	syscall
	
	# Get the user's input
	li $v0, 5
	syscall
	
	# store the result in $t0
	move $t0, $v0
	
	# input minus 2
	sub $t6, $t0, 2
	
	# set i as 1
	li $t1, 0
	
	# for loop
	for_start0: nop
		bgt $t1, $t6, exit_loop              # when i from 1 to N-2
		addi $t1, $t1, 1                     # i++
			rem $t5, $t1, $t2            # store the reminder of i/4
			bgt $t5, $zero, if_start1    # check if the reminder is 0
			rem $t5, $t1, $t3            # store the reminder of i/9
			beq $t5, $zero, if_start1    # if the reminder is not 0
			li $v0, 4                    # print DEAD
			la $a0, Dead
			syscall
			if_start1: 
			
			rem $t5, $t1, $t3            # If the reminder of i/9 is 0, i/4 is not 0, print BEEF 
			bgt $t5, $zero, if_start2    
			rem $t5, $t1, $t2            
			beq $t5, $zero, if_start2
			li $v0, 4
			la $a0, Beef
			syscall
			if_start2:
			
			rem $t5, $t1, $t4            # if the reminder of i/36 is 0, print DEADBEEf
			bgt $t5, $zero, if_start3
			li $v0, 4
			la $a0, DeadBeef
			syscall
			if_start3:
			
			rem $t5, $t1, $t2            # if the reminder of i/4 and i/9 is not 0, print the number
			beq $t5, $zero, if_start4
			rem $t5, $t1, $t3
			beq $t5, $zero, if_start4
			li $v0, 1
			move $a0, $t1
			syscall
			li $v0, 4
			la $a0, space
			syscall
			if_start4:
			
		b for_start0
		exit_loop: nop
		
			rem $t5, $t0, $t2            # The whole thing downhere is to check the last number
			bgt $t5, $zero, if_start5    # then print out the correct output without change line
			rem $t5, $t0, $t3
			beq $t5, $zero, if_start5
			li $v0, 4
			la $a0, Dead1
			syscall
			if_start5:
			
			rem $t5, $t0, $t3 
			bgt $t5, $zero, if_start6
			rem $t5, $t0, $t2
			beq $t5, $zero, if_start6
			li $v0, 4
			la $a0, Beef1
			syscall
			if_start6:
			
			rem $t5, $t0, $t4
			bgt $t5, $zero, if_start7
			li $v0, 4
			la $a0, DeadBeef1
			syscall
			if_start7:
			
			rem $t5, $t0, $t2
			beq $t5, $zero, if_start8
			rem $t5, $t0, $t3
			beq $t5, $zero, if_start8
			li $v0, 1
			move $a0, $t0
			syscall
			if_start8:
