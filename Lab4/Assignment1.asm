.data
x : .word -2147483648
y : .word -5
.text
start:
	lw $s1,x
	lw $s2,y
	li $t0,0 		#No Overflow is default status
	addu $s3,$s1,$s2 	# s3 = s1 + s2
	xor $t1,$s1,$s2 	#Test if $s1 and $s2 have the same sign
	bltz $t1,EXIT 		#If not, exit
	slt $t2,$s3,$s1
	bltz $s1,NEGATIVE 	#Test if $s1 and $s2 is negative?
	beq $t2,$zero,EXIT 	#s1 and $s2 are positive
	 			# if $s3 > $s1 then the result is not overflow
	j OVERFLOW
NEGATIVE:
	bne $t2,$zero,EXIT 	#s1 and $s2 are negative
 				# if $s3 < $s1 then the result is not overflow
	OVERFLOW:
	li $t0,1 		#the result is overflow
EXIT:
