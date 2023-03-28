.data
input1: .asciiz "Enter the first integer: "
input2: .asciiz "Enter the second integer: "
result: .asciiz "You entered: "
andString: .asciiz " and "
    
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
    add $s2, $s1, $s0
    
    #printing the added result
    li $v0, 1
    move $a0, $s2
    syscall
    
    # Exit program
    li $v0, 10
    syscall
