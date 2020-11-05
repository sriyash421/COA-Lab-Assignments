# Assignment - 6
# Problem  - 3
# Semester Aut - 2020 
# Group - 53
# Name : Hardik Aggarwal 
# Roll : 18CS10021
# Name : Sriyash Poddar
# Roll : 18CS30040

##########Data Segment########################
.data
msg_input1:   .asciiz "Enter the first number: "
msg_input2:   .asciiz "Enter the second number: "
over_number:   .asciiz "Please enter 16 bit unsigned numbers"
product_msg:
       .asciiz "The product is: "
newline:
       .asciiz "\n"
###########Code Segment#####################
       .text
       .globl main

main:
    la $a0, msg_input1 
    li $v0, 4  # prints the message string
    syscall

    li $v0, 5  # reads first integer
    syscall
    move $t0, $v0 # result returned in $v0
        
    la $a0, msg_input2 
    li $v0,4  # prints the message string
    syscall
        
    li $v0, 5 # reads second integer
    syscall
    move $t1, $v0 # result returned in $v0

    move $a0, $t0
    move $a1, $t1

    jal check_for_overflow
    # If return value is 0, print error message
    beq $v0, 0, overflow

    jal seq_mult_unsigned     # procedural call to lest shif t multiplier
    
    move $t0, $v0
    li $v0, 4                # print product message
    la $a0, product_msg
    syscall 
    li $v0, 1
    move $a0, $t0          # print the final result
    syscall

    j exit


overflow:            # prints overflow message
    li $v0, 4
    la $a0, over_number
    syscall

    j exit

exit:
    li $v0, 10       # exit the program
    syscall

check_for_overflow:
    # Check if both numbers are non - negative and < 2^16
    bgeu $t0, 65536, return0
    bgeu $t1 , 65536, return0
    j return1

    # Return 0
    return0:
    li $v0, 0
    j $ra

    # Return 1
    return1:
    li $v0, 1
    j $ra 

seq_mult_unsigned:
    

    # loop variable
    li $s0, 0
    # 2 function arguments
    move $t0, $a0
    move $t1, $a1

    # product = 0
    li $t2 , 0 
    Loop:
        li $s2, 0           # temp = 0
        andi $t4, $t0, 1  # t1 gets the bit
        beq $t4, $zero, next_  # compares zero =  t2 and if true adds 0 to the product else adds y << i to the product.
        addu $s2, $s2, $t1      # add Y << i to temp  
        
        next_:
        addu $t2, $t2, $s2        # product += temp
        sll $t1, $t1, 1                # unsigned left shift of the 2nd number
        srl $t0, $t0, 1             # X right shift

        # increase loop variable by 1 and check for loop condition
        addi $s0, $s0, 1
        blt $s0, 16, Loop
    
    move $v0, $t2
    jr $ra            # return statement














    
