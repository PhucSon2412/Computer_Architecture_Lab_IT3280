.text
li $s1 -10	# Khoi tao $s1
sra $s2,$s1,31	# Neu $s1 < 0 thi $s2 = -1
xor $s0,$s1,$s2 # Neu $s2 = -1 thi dao bit $s1 roi luu vao $s0
sub $s0,$s0,$s2	# Neu $t2 = -1 thi $s0 là so bu 2 cua $s1
