# Ho va ten : Tran Phuc Son
# MSSV : 20225666
.data
A: .word  -7, 10, -2, 4, 0, -5, 3, -9, 6, -1
Aend: .word
blank: .asciiz " "
.text
main: 
    	la $s0,A           	# $a0 = dia chi cua A[0]
    	la $s1,Aend        	# $a1 = dia chi cua A[n-1]
    	li $s2,10		# So phan tu cua A
	j sort        
after_sort: 
    	la $s0,A           	# $a0 = dia chi cua A[0]
    	la $s1,Aend        	# $a1 = dia chi cua A[n-1]
    	li $t1,0		# i = 0
    	j print     		# In ra mang da sap xep
sort: 
    	beq $s0,$s1,after_sort 		# Neu chi con 1 phan tu thi da sap xep xong
    	j max              		# Ham tim gia tri lon nhat
after_max: 
    	lw $t0,0($s1)      # Load gia tri cua phan tu cuoi cùng vào $t0
    	sw $t0,0($v0)      # Sao chép phan tu cuoi cùng vào vi trí phan tu lon nhat
    	sw $v1,0($s1)      # Sao chep gia tri lon nhat vào phan tu cuoi cung
    	addi $s1,$s1,-4    # Loai bo phan tu cuoi cung khoi qua trinh sap xep
    	j sort             
max:
    	addi $v0,$s0,0     # Con tro max tro den phan tu dau tien
    	lw $v1,0($v0)      # Khoi tao gia tri max bang phan tu dau tien
    	addi $t0,$s0,0     # Con tro next
loop:
    	beq $t0,$s1,after_max   # Neu next = last, quay lai
    	addi $t0,$t0,4     	# Chuyen toi phan tu tiep theo
    	lw $t1,0($t0)      	# Load gia tri cua phan tu tiep theo
    	slt $t2,$t1,$v1    	# (next) < (max) ?
    	bne $t2,$zero,loop 	# Neu (next) < (max), lap lai vong lap
    	addi $v0,$t0,0     	# Cap nhat con tro max
    	addi $v1,$t1,0     	# Cap nhat gia tri max
    	j loop       
print:	# Ham in ra mang sau khi sap xep
 	beq $t1, $s2, end	
 	mul $t2, $t1, 4
 	add $t3, $s0, $t2
 	lw $a0, ($t3)
 	li $v0, 1
 	syscall
 	li $v0, 4
 	la $a0, blank
 	syscall
 	addi $t1, $t1, 1
	j print 
end:
	li $v0, 10         	# Thoat chuong trinh
    	syscall
