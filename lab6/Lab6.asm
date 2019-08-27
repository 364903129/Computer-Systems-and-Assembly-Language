# Haofan Wang
# hwang108@ucsc.edu
# Lab6: vigenere cipher
# Due date 3/11/2018
# 01E TA: Carlos Espinosa

#Pseudocode:
#	EncryptChar(text, key){
#		if the first char is a letter
#			encrypt it
#			store in $v0
#		else
#			store in $v0
#			
#	EncryptString(text, key){
#		if (text.length = key.length){
#			EncryptChar(text, key)
#			increment the address of text and key
#			if (the address of the text is  null){
#				exit loop
#			}
#			EncryptString(text, key)
#		}
#		if (text.length > key.length){
#			EncryptChar(text, key)
#			increment the address of text and key
#			if (the address of the text is  null){
#				exit loop
#			}
#			if (the address of the key is null){
#				go back to the first address
#			}
#			EncryptString(text,key)
#			
#	DecryptChar(text, key){
#		if the first char is a letter
#			Decrypt it
#			store in $v0
#		else
#			store in $v0
#			
#	DecryptString(text, key){
#		if (text.length = key.length){
#			DecryptChar(text, key)
#			increment the address of text and key
#			if (the address of the text is  null){
#				exit loop
#			}
#			DecryptString(text, key)
#		}
#		if (text.length > key.length){
#			DecryptChar(text, key)
#			increment the address of text and key
#			if (the address of the text is  null){
#				exit loop
#			}
#			if (the address of the key is null){
#				go back to the first address
#			}
#			DecryptString(text,key)

EncryptChar:
		bge $a0, 123, print_out		# print the character when it is not a letter
		ble $a0, 64, print_out
		ble $a0, 90, Encrypt_upper	# Encrypt Upper case letter
		bge $a0, 97, Encrypt_lower	# Encrypt Lower case letter
	
	j print_out				# ascii between 91 to 96 go to print_out
	
	Encrypt_upper:				# operation for encrypt upper case letter
		sub $a0, $a0, 65
		sub $a1, $a1, 65
		add $v0, $a0, $a1
		rem $v0, $v0, 26
		addi $v0, $v0, 65
	j exit_EncryptChar
	
	Encrypt_lower:				# operation for encrypt lower case letter
		sub $a0, $a0, 97
		sub $a1, $a1, 65
		add $v0, $a0, $a1
		rem $v0, $v0, 26
		addi $v0, $v0, 97
	j exit_EncryptChar
	
	print_out:				# store the nonletter char into v0
		move $v0, $a0
	
	exit_EncryptChar:			# return to it's parent function
		jr $ra

EncryptString:
		sw $ra, ($sp)
		subi $sp, $sp, 4
		move $t3, $a0				# move addresses
		move $t4, $a1
	
	EncryptString_loop:
		lb $a0, ($t3)			# get the first char of the text
		lb $a1, ($t4)			# get the first char of the key
		jal EncryptChar			# encrypt it
		sb $v0, ($a2)
		addi $a2, $a2, 1
		addi $t3, $t3, 1
		lb $t5, ($t3)
		bge $t5, 123, skip_key		# if the char is nonletter, address of the key will not increment
		ble $t5, 64, skip_key
		ble $t5, 90, increment_key	# if the char is letter, increment the address of the key
		bge $t5, 97, increment_key
		ble $t5, 96, skip_key
	increment_key:
		addi $t4, $t4, 1
	skip_key:
		lb $t6, ($t4)
		beqz $t5, end_encrypt		# if all char encrypted, stop encrypt
		beqz $t6, repeat_key		# if reach the end of the key, but text is not, go back to the first key
	b EncryptString_loop
	j end_encrypt
	
	repeat_key:				# go back to the first char of the key
		la $t4,	testES_key
		b EncryptString_loop
	
	end_encrypt:
	
		addi $sp, $sp, 4		# return to it's parent function
		lw $ra, ($sp)
		jr $ra
	
DecryptChar:
		bge $a0, 123, print__out		# print the character when it is not a letter
		ble $a0, 64, print__out
		ble $a0, 90, Decrypt_upper		# Decrypt Upper case letter
		bge $a0, 97, Decrypt_lower		# Decrypt Lower case letter
	
	j print__out				# ascii between 91 to 96 go to print_out
	
	Decrypt_upper:				# operation for Decrypt upper case letter
		sub $a0, $a0, 65
		sub $a1, $a1, 65
		add $v0, $a0, $a1
		rem $v0, $v0, 26
		addi $v0, $v0, 65
	j exit_DecryptChar
	
	Decrypt_lower:				# operation for Decrypt lower case letter
		sub $a0, $a0, 97
		sub $a1, $a1, 65
		add $v0, $a0, $a1
		rem $v0, $v0, 26
		addi $v0, $v0, 97
	j exit_DecryptChar
	
	print__out:				# store the nonletter char into v0
		move $v0, $a0
	
	exit_DecryptChar:			# return to it's parent function
	jr $ra

DecryptString:
	sw $ra, ($sp)
	subi $sp, $sp, 4
	move $t3, $a0				# move addresses
	move $t4, $a1
	
	DecryptString_loop:
		lb $a0, ($t3)			# get the first char of the text
		lb $a1, ($t4)			# get the first char of the key
		jal DecryptChar			# Decrypt it
		sb $v0, ($a2)
		addi $a2, $a2, 1
		addi $t3, $t3, 1
		lb $t5, ($t3)
		bge $t5, 123, skip__key		# if the char is nonletter, address of the key will not increment
		ble $t5, 64, skip__key
		ble $t5, 90, increment__key	# if the char is letter, increment the address of the key
		bge $t5, 97, increment__key
		ble $t5, 96, skip__key
	increment__key:
		addi $t4, $t4, 1
	skip__key:
		lb $t6, ($t4)
		beqz $t5, end_Decrypt		# if all char Decrypted, stop Decrypt
		beqz $t6, repeat__key		# if reach the end of the key, but text is not, go back to the first key
	b DecryptString_loop
	j end_Decrypt
	
	repeat__key:
		la $t4,	testDS_key		# go back to the first char of the key
	b DecryptString_loop
	
	end_Decrypt:
	
	addi $sp, $sp, 4			# return to it's parent function
	lw $ra, ($sp)
	jr $ra
