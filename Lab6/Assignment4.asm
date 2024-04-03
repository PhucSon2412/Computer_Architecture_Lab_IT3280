# Ho va ten : Tran Phuc Son
# MSSV : 20225666
.data
A: .word  2, 0, -2, 2, -5, 6, -6, 6
Aend: .word
blank: .asciiz " "
.text
main: 
    	la $s0,A           		# $a0 = dia chi cua A[0]
    	la $s1,Aend        			
    	addi $s3,$s0,4			# Con tro cua mang	
    	li $s2,8			# So phan tu cua A
	j sort
after_sort: 
    	la $s0,A           		# $a0 = dia chi cua A[0]
    	la $s1,Aend        		# $a1 = dia chi cua A[n-1]
    	la $t1,0			# i = 0
    	j print     			# In ra mang da sap xep
    	
swap:					# Swap 2 phan tu cua mang
	sw $t4,-4($t3)			
   	sw $t5, 0($t3)
   	sub $t3,$t3,4
   	j while
sort: 
    	beq $s3,$s1,after_sort 		# Da duyet qua het mang
    	lw $t4,0($s3)			# Gia tri cua phan tu dang xet
    	addi $t3,$s3,0			# Con tro de duyet nguoc lai
while:
    	beq $t3,$s0,sort		# Neu duyet nguoc lai het phan tu thi ket thuc
    	lw $t5,-4($t3)			# Phan tu dung truoc
    	sle $t6,$t5,$t4			# Neu $t5 > $t4 thi $t6 = 0
    	beq $t6,$zero,swap		# Neu $t5 > $t4 thi swap $t5 voi $t4
    	addi $s3,$s3,4			# Duyet phan tu tiep theo
    	j sort
    	
print:	# Ham in ra mang sau khi sap xep
 	beq $t1, $s2, end	# Neu i = so phan tu cua A thi dung lai
 	mul $t2, $t1, 4		# 4i
 	add $t3, $s0, $t2	# Con tro A[i]
 	lw $a0, ($t3)		# Gia tri cua A[i]
 	li $v0, 1		
 	syscall			# In ra gia tri cua A[i]
 	li $v0, 4
 	la $a0, blank
 	syscall			# In ra khoang trong
 	addi $t1, $t1, 1	# i = i + 1
	j print 
end:
	li $v0, 10         	# Thoat chuong trinh
    	syscall
