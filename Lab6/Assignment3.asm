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
    	sub $s1,$s1,4			# $a1 = dia chi cua A[n-1]
	li $t3,1			# Neu A thay doi thi gan bang 1
	li $t8,1
	j sort
after_sort: 
    	la $s0,A           		# $a0 = dia chi cua A[0]
    	la $s1,Aend        		
    	sub $s1,$s1,4			# $a1 = dia chi cua A[n-1]
    	li $s2,8			# So phan tu cua A
    	la $t1,0			# i = 0
    	j print     			# In ra mang da sap xep
sort: 
    	beq $t3,$zero,after_sort 	# Neu mang khong thay doi thi da sap xep xong
    	li $t3,0			# Mang chua co thay doi
    	j browse              		         
browse:
    	addi $t4,$s0,0     		# Con tro tro den phan tu dau tien
loop:
    	beq $t4,$s1,sort  	 	# Neu v0 la phan tu cuoi cung thi dung lai
    	lw $t5,0($t4)			# Gia tri phan tu dau tien
    	lw $t6,4($t4)			# Gia tri phan tu tiep theo
    	sle $t7,$t5,$t6			# Neu $t5 <= $t6 thi $t7 = 1
    	beq $t7,$t8,after_swap 		# Neu $t5 < $t6 thi khong can swap
    	swap:
    		li $t3,1		# Mang co su thay doi
    		sw $t5,4($t4)		
    		sw $t6,0($t4)
    		j after_swap
    	after_swap:
    	addi $t4,$t4,4			# Tro den phan tu tiep theo
    	j loop       
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
