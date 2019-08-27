# Haofan Wang
# hwang108@ucsc.edu
# Lab6: vigenere cipher
# Due date 3/11/2018
# 01E TA: Carlos Espinosa

Magic number:  ob1100, 0123

I learned how Vigenere Cipher works, and how to create a circular output(the letter next to Z is A).

I also learned how to use sp and ra to return to the parent function.

1, I wrote a Decrypt test to test if my decrypt code is correct. I switch the expected output and plain text(provided in test_Lab6.asm). Then change jal encryptchar to jal decryptchar, so the main function can reach the algorithm of decrypt. It works just fine.

2, When I attempt encrypt with a keystring that has illegal characters, the program will still running, the output is calculated by the algorithm I made for encryptChar and decryptChar using ASCII.

3, write a label, then the operation, then write (b label) to do recursive.

4, I'll store the address of $a to a temporary register in each subroutine. So I can have enough register for the arguments.

