.text
	li $t0,0 		# Khoi tao $t0 = 0
	li $s1,-2147483648
	li $s2,-2
	addu $s3,$s1,$s2	# $s3 = $s1 + $s2
	xor $t1,$s1,$s2 	# Kiem tra xem $s1 va $s2 co cung dau khong
	bltz $t1,exit 		# Neu $t1 < 0 thi nhay den exit
	xor $t2,$s3,$s1 	# Kiem tra xem $s1 va $s3 co cung dau khong
	bgtz $t2,exit 		# Neu $t2 > 0 thi nhay den exit
	li $t0,1 		# Neu tran so, ket qua $t0 = 1
exit: 
