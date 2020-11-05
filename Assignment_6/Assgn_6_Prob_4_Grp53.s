# Assignment - 6
# Problem  - 4
# Semester Aut - 2020 
# Group - 53
# Name : Hardik Aggarwal 
# Roll : 18CS10021
# Name : Sriyash Poddar
# Roll : 18CS30040


########## Data Segment ########################
.data
msg_input1:   .asciiz "Enter the first number: "
msg_input2:   .asciiz "Enter the second number: "
over_number:   .asciiz "Please enter 16 bit signed numbers"
product_msg:
       .asciiz "The product is: "
newline:
       .asciiz "\n"
########### Code Segment #####################
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
    
    jal seq_mult_booth
    
    move $t0, $v0         
    li $v0, 4           # print product message
    la $a0, product_msg      
    syscall
    li $v0, 1         # load final value in the $a0
    move $a0, $t0
    syscall
    

    j exit


overflow:       # prints overflow message
    li $v0, 4
    la $a0, over_number
    syscall

exit:        # exit the program
    li $v0, 10
    syscall

check_for_overflow:
    # Check if both numbers are non - negative and < 2^16
    bge $t0, 32768, return0           
    bge $t1 , 32768, return0
    blt $t0, -32768, return0
    blt $t1 , -32768, return0
    j return1

    # Return 0
    return0:
    li $v0, 0
    j $ra

    # Return 1
    return1:
    li $v0, 1
    j $ra 


seq_mult_booth:

    li $s0, 0      # loop variable


    move $t0, $a0     # argument 1
    move $t1, $a1       # argument 2
    li $t2 , 0  # product

    # product = multiplier in beginning 
    add $t2, $t2, $t1

    li $s2 , 0   # prev bit

    # shift Mcand by 16 bits
    sll $t0, $t0, 16


    Loop:
        
        andi $t3, $t2, 1  # t3 gets the bit

        beq $t3, $s2, updates  # if equal do nothing 
        beq $t3, $zero, addition  # if current bit is zero product += Mcand

        subtraction:   # else subtraction
        # product = product - Mcand
        sub $t2, $t2, $t0

        j updates

        addition:
        # product = product + Mcand
        add $t2, $t2, $t0
        j updates

        updates:
        #  update prev bit and shift product right by one bit 

        move $s2, $t3
        sra $t2, $t2, 1     # product to right

        # increment and check for loop conditioon 
        addi $s0, $s0, 1
        blt $s0, 16, Loop

    bge $t1, $zero, returns
    add $t2, $t2, 1
   
    returns:                # return  statement
        move $v0, $t2
        jr $ra

