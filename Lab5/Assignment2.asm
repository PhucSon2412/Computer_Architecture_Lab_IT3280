# Ho va ten : Tran Phuc Son
# MSSV : 20225666
.data
	s1: .asciiz "The sum of "
	s2: .asciiz " and "
	s3: .asciiz " is "
.text
	li $s0,12345678 	# s0 = 12345678
	li $s1,7879988 		# s1 = 7879988
	add $s2,$s0,$s1 	# s2 = s0 + s1
	
 # Print string "s1"
 li $v0, 4
 la $a0, s1
 syscall

 # Print $s0
 li $v0, 1
 move $a0, $s0
 syscall

 # Print string "s2"
 li $v0, 4
 la $a0, s2
 syscall

 # Print $s1
 li $v0, 1
 move $a0, $s1
 syscall

 # Print string "s3"
 li $v0, 4
 la $a0, s3
 syscall

 # Print $s2
 li $v0, 1
 move $a0, $s2
 syscall
