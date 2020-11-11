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
input_msg: .asciiz "Input number of elements in the array:- 0<N<1000\n"
array_msg: .asciiz "Input elements of the array:- \n"
result:  .asciiz "\nThe sorted array is:-   "
newline:        .asciiz "\n"
space:  .asciiz " "
array: .word 0 : 1000

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main

    main:
        # Reading size of array
        # la $a0, input_msg
        # lw $v0, PRINT_STRING_CODE
        # syscall

        # lw $v0, READ_INT_CODE
        # syscall
        # move $t0, $v0

        # Loading fixed size
        li $t0, 8

        # Reading all elements of the array
        la $a0, array_msg
        lw $v0, PRINT_STRING_CODE
        syscall

        la $t1, array
        li $t2, 0

        input_loop:
            # Reading the elements in a sequence
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

        # printing the sorted array
        la $t1, array
        li $t2, 0

        la $a0, result
        lw $v0, PRINT_STRING_CODE
        syscall
        
        la $a0, newline
        lw $v0, PRINT_STRING_CODE
        syscall

        output_loop:
            bge $t2, $t0, end_out_loop
            
            lw $a0, 0($t1)
            lw $v0, PRINT_INT_CODE
            syscall

            la $a0, space
            lw $v0, PRINT_STRING_CODE
            syscall

            addi $t1, $t1, 4
            addi $t2, $t2, 1
            j output_loop
        
        end_out_loop:

            la $a0, newline
            lw $v0, PRINT_STRING_CODE
            syscall
            lw $v0, EXIT_CODE
            syscall