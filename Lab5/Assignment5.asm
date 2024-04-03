# Ho va ten : Tran Phuc Son
# MSSV : 20225666
.data
 	get_char: .space 20
 	message1: .asciiz "Nhap ky tu :"
 	message2: .asciiz "\n"
 	message3: .asciiz "Ket qua : "
.text
 	li $s0, 20 		# N = 20
 	li $s1, 0 		# i = 0
 	la $s2, get_char 	# Dia chi cua get_char[0]
 	li $s3, 10 		# Ki tu \n trong ascii
read_char:
 	beq $s1, $s0, end_read_char 	# Neu i = N thi ngung nhan ki tu

 	li $v0, 4		# In ra man hinh "Nhap ky tu :"
 	la $a0, message1
 	syscall

 	li $v0, 12 		# Nhan ki tu
 	syscall

 	move $t0, $v0			# $t0 = $v0
 	beq $t0, $s3, end_read_char 	# Neu bam Enter thi chuyen den end_read_char

	li $v0, 4		# In ky tu "\n"
 	la $a0, message2	
 	syscall

 	add $s5, $s2, $s1 	# Dia chi cua get_char[i] = Dia chi cua get_char[0] + i
 	sb $t0, 0($s5) 		# Luu ki tu vao mang get_char
 	addi $s1, $s1, 1 	# i = i + 1
 	j read_char		# Lap lai qua trinh nhan ky tu
end_read_char:

	li $v0, 4		# In ra man hinh "Ket qua : "
 	la $a0, message3
 	syscall

# In chuoi dao nguoc
print_string:
 	li $v0, 11		# In ky tu ra man hinh
 	lb $a0, 0($s5)		# Ki tu duoc in 
 	syscall

 	beq $s5, $s2, exit	# Neu $s5 = get_char[0] thi exit
 	addi $s5, $s5, -1	# $s5 = $s5 - 1
 	j print_string		# Chuyen den ki tu tiep theo
exit:
 	li $v0, 10	# Thoat chuong trinh
 	syscall
