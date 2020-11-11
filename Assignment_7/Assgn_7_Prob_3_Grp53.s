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

array_msg: .asciiz "Input elements of the array:- \n"
search_msg: .asciiz "Input search element:- \n"
result_t:    .asciiz "\nThe search element is present at index (0 based indexing ) : "
result_f:    .asciiz "\nThe search element is not present\n"
newline:   .asciiz "\n"
space:     .asciiz " "
array:     .word 0 : 1000

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
    main:
       
        
        # Loading fixed size
        li $t0, 9

        la $a0, array_msg
        lw $v0, PRINT_STRING_CODE
        syscall

        la $t1, array
        li $t2, 0

        input_loop:
            bge $t2, $t0, end_in_loop

            lw $v0, READ_INT_CODE
            syscall
            sw $v0, 0($t1)

            addi $t1, $t1, 4
            addi $t2, $t2, 1
            j input_loop
        
        end_in_loop:

        la $t1, array
        # i=1
        li $t2, 1

        # Loop to start sorting the elements
        sort_loop:
            la $t1, array
            # if i>=size, end loop
            bge $t2, $t0, end_sort_loop
            # d = i
            move $t3, $t2
            # Inserting arr[d] to its sorted position
            while_loop:
                la $t1, array
                mul $t4, $t3, 4
                add $t1, $t1, $t4
                # if d <0, element was in sorted position
                ble $t3, 0, end_while
                
                # loading arr[d]
                lw $t5, 0($t1)
                # loading arr[d-1]
                lw $t6, -4($t1)
                bge $t5, $t6, end_while
                # Keep shifting the elements as a[d] < a[d-1]
                lw $t7, 0($t1)
                sw $t6, 0($t1)
                sw $t7, -4($t1)
                # d = d-1
                add $t3, $t3, -1
                j while_loop
        end_while:
            # insert next element
            add $t2,$t2,1
            j sort_loop
        end_sort_loop:

        # storing the search element
        la $a0, search_msg
        lw $v0, PRINT_STRING_CODE
        syscall

        lw $v0, READ_INT_CODE
        syscall
        move $a2, $v0
        
        # initialising search boundaries, l = 0 and r = n -1
        add $a0, $zero, $zero
        addi $a1, $t0, -1
        jal BinarySearch
        move $t1, $v0
        bge $t1, $zero, present



not_present:
            # output for unsuccessful search
    la $a0, result_f
    lw $v0, PRINT_STRING_CODE
    syscall
    j exit_
        
present:
    # output for successful search
    la $a0, result_t
    lw $v0, PRINT_STRING_CODE
    syscall

    move $a0, $t1
    lw $v0, PRINT_INT_CODE
    syscall

    j exit_




exit_:
    # exit
    lw $v0, EXIT_CODE
    syscall




BinarySearch:

    # base condition if l == r compare and return 
    bne $a0 , $a1 , recurse 

    la $t1, array
    move $t2 , $a0
    mul $t2, $t2, 4
    add $t1, $t1 , $t2
    lw $t3, 0($t1)
    beq $t3, $a2, found               # if equal return index else return -1
    addi $v0, $zero, -1
    jr $ra    

    found:  # return the index 
    move $v0, $a0
    jr $ra
    

    recurse:
            addi $sp, $sp, -16
	      	sw $ra, ($sp) # Storing ra
	      	sw $a0, 4($sp) # Storing the three arguments
	      	sw $a1, 8($sp)
            sw $a2, 12($sp)


            la $t1, array      # load the array 
            move $t2 , $a0
            move $t4, $a1

            add $t2, $t2, $t4            # calculate mid = (l + r) >> 1
            sra $t2, $t2, 1
            mul $t5, $t2, 4                  # get the address of a[mid]


            add $t1, $t1 , $t5    
            lw $t3, 0($t1)
            ble $a2, $t3, less_than       # compare the value with  a[mid]

            j greater_than
        

            less_than:                 # if value <= a[mid] recurse in left  half
                move $a1, $t2
                jal BinarySearch
                j restore

            greater_than:             # if value is > a[mid] recurse in right half 

                addi $t2, $t2, 1
                move $a0, $t2
                jal BinarySearch
                j restore

            restore:            # restore the stack pointer 

                lw $ra, ($sp)
	          	addi $sp, $sp, 16
	          	jr $ra

        
