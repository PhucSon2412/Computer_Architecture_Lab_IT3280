# Ho va ten : Tran Phuc Son
# MSSV : 20225666
.data
 	largest: .asciiz "Largest:\t"
 	smallest: .asciiz "\nSmallest:\t"
 	dot: .asciiz ", "
.text
main: 
	# Input
	li $s0,500
 	li $s1,900
 	li $s2,-300
 	li $s3,-600
 	li $s4,800
 	li $s5,-200
 	li $s6,-750
 	li $s7,1000
 	jal Initialize
 	nop
	# Output
	li $v0,4 		# In ra "Largest:"
 	la $a0,largest
 	syscall
	li $v0,1 		# Gia tri Max
 	add $a0,$t0,$zero
 	syscall
	li $v0,4		# In ra ", "
 	la $a0,dot
 	syscall
 	li $v0,1 		# Index Max
 	add $a0,$t5,$zero
 	syscall
	li $v0,4 		# In ra "Smallest:"
 	la $a0,smallest
 	syscall
	li $v0,1 		# Gia tri Min
 	add $a0,$t1,$zero
 	syscall
	li $v0,4 		# In ra ", "
 	la $a0,dot
 	syscall
 	li $v0,1 		# Index Min
 	add $a0,$t6,$zero
 	syscall
	li $v0,10 		# Terminate
 	syscall
SwapMax:
	add $t0,$t3,$zero	# Thay doi Max
 	add $t5,$t2,$zero	# Thay doi index cua Max
 	jr $ra
SwapMin:
	add $t1,$t3,$zero	# Thay doi Min
 	add $t6,$t2,$zero	# Thay doi index cua Min
 	jr $ra
Initialize:
 	add $t9,$sp,$zero
 	addi $sp,$sp,-32	# Cap phat bo nho cho 8 phan tu
 	sw $s1,0($sp)
 	sw $s2,4($sp)
 	sw $s3,8($sp)
 	sw $s4,12($sp)
 	sw $s5,16($sp)
 	sw $s6,20($sp)
 	sw $s7,24($sp)
 	sw $ra,28($sp) 	# Luu $ra
 	add $t0,$s0,$zero 	# Khoi t?o Max
 	add $t1,$s0,$zero 	# Khoi tao Min
 	li $t5,0 		# Khoi tao Index cua Max
 	li $t6,0 		# Khoi tao Index cua Min
 	li $t2,0 		# Khoi tao i = 0
Find:
 	addi $sp,$sp,4
 	lw $t3,-4($sp)		# Load phan tu tiep theo
 	sub $t4,$sp,$t9
 	beq $t4,$zero,Done 	# Neu da duyet het cac phan tu thi nhay den "Done"
 	addi $t2,$t2,1 		# i = i + 1
 	sub $t4,$t0,$t3	
 	bltzal $t4,SwapMax 	# Neu $t3 > Max thi swap Max
 	sub $t4,$t3,$t1
 	bltzal $t4,SwapMin 	# Neu $t3 < Min thi swap Min
 	j Find 			# Duyet phan tu tiep theo
Done:
	lw $ra,-4($sp)		# Load $ra
 	jr $ra 			# Quay lai main
# Ho va ten : Tran Phuc Son
# MSSV : 20225666