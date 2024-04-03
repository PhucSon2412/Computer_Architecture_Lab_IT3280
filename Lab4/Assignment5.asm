.text
    li $t0, 1024	# So can nhan
    li $t1, 20		# So mu cua 2
loop:
    beq $t1,$zero,exit	# Neu $t1 = 0 thi exit
    sll $t0,$t0,1	# Dich bit $t0 sang trai
    subi $t1,$t1,1	# $t1 = $t1 - 1
    j loop
exit:
