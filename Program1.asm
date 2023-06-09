#Name: Tony Diaz, Xavier Felix, Tanay Shah, Clifton Williams
#Date: April 2, 2023
#Objective: Ask user for 2 inputs
#show the addition, subtraction, multiplication and division of inputs
#Check if input 1 and 2 are equal

.data
input1: .asciiz "Enter the first integer: "
input2: .asciiz "Enter the second integer: "
result: .asciiz "You entered: "
andString: .asciiz " and "
addResult: .asciiz "\nThe addition of the integers is "
subResult: .asciiz "\nThe subtraction of the integers is "
mulResult: .asciiz "\nThe multiplication of the integers is "
divResult: .asciiz "\nThe division of the integers is "
divRemainder: .asciiz " with the remainder of "
equalInputs: .asciiz "\nUser inputs are the same\n"
unequalInputs: .asciiz "\nUser inputs are different\n"
    
.text
main:
    # Ask usr for input 1
    li $v0, 4
    la $a0, input1
    syscall
    
    # Move into $s0
    li $v0, 5
    syscall
    move $s0, $v0
    
    # Ask usr for input 2
    li $v0, 4
    la $a0, input2
    syscall
    
    # Move into $s1
    li $v0, 5
    syscall
    move $s1, $v0
    
    # Print result string 
    li $v0, 4
    la $a0, result
    syscall
    
    #print input1
    li $v0, 1
    move $a0, $s0
    syscall
   
    #print " and "
    li $v0, 4
    la $a0, andString
    syscall
    
    #print  input2
    li $v0, 1
    move $a0, $s1
    syscall
    
    #adding the 2 values 
    add $s2, $s0, $s1
    
    #subtracting the values
    sub $s3, $s0, $s1 
    
    #multiplying the values
    mul $s4, $s0, $s1
    
    #dividing the values
    div $s5, $s0, $s1
    
    #print the add statement
    li $v0, 4
    la $a0, addResult
    syscall
    
    #printing the added result
    li $v0, 1
    move $a0, $s2
    syscall
    
    #printing the subtract statement
    li $v0, 4
    la $a0, subResult
    syscall
    
    #printing the subtracted result
    li $v0, 1
    move $a0, $s3
    syscall
    
    #printing the multiplied statement
    li $v0, 4
    la $a0, mulResult
    syscall
    
    #printing the multiplied result
    li $v0, 1
    move $a0, $s4
    syscall
    
    #printing the divided statement
    li $v0, 4
    la $a0, divResult
    syscall
    
    #printing the divided result
    li $v0, 1
    mflo $a0
    syscall
    
    #printing the remainder statement
    li $v0, 4
    la $a0, divRemainder 
    syscall
    
    #printingthe remainder result
    li $v0, 1
    mfhi $a0
    syscall

    # Check if $s0 is equal to $s1 and branch depending on the result
    beq $s0, $s1, equal
        # Print the string to let the user know what the inputs are different
        li $v0, 4
        la $a0, unequalInputs
        syscall
        j exitProgram       # Jump to exitProgram so that the equal code block is not executed

    equal:
        # Print the string to let the user know what the inputs are equal
        li $v0, 4
        la $a0, equalInputs
        syscall

    # Exit program
    exitProgram:
        li $v0, 10
        syscall
