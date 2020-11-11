# Assignment - 7
# Problem  - 1
# Semester Aut - 2020 
# Group - 53
# Name : Hardik Aggarwal 
# Roll : 18CS10021
# Name : Sriyash Poddar
# Roll : 18CS30040


####################### Data segment ######################################
 .data
message: .asciiz "The string before converting is:- "
result:  .asciiz "\nThe string after converting to lower string is:-   "
input: .asciiz "laflLJ@Hh5lk22LjhJ23B#N87vhg"
answer: .space 100
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
main:

# load the strings in register  
	la $t0, input
	la $t2, answer

# Traverse the string
	L1:

		lb $t1, ($t0)

		beqz $t1, out   # exit if NULL character encountered 

		
		bgt $t1, 96, keep       # If capital no change

		
		bgt $t1, 64, change             # If small letter increment by 32

		
		j keep    # Other characters

		change:
			addi $t1, $t1, 32

		keep:
			sb $t1, ($t2)       	# Store it in the location

		# Increment memory storage location
		addi $t0, $t0, 1
		addi $t2, $t2, 1
		j L1

out: 
	sb $t1, ($t2)
	li $v0, 4
	la $a0, message   # print message 
	syscall

	li $v0, 4
	la $a0, input     # print initial string 
	syscall
	
	li $v0, 4
	la $a0, result      # print the output message 
	syscall

	li $v0, 4
	la $a0, answer    # print the final string 
	syscall


exit:
	li $v0, 10
	syscall  # Exit

