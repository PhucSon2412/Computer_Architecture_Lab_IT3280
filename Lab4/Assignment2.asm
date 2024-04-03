.text
	li $s0, 0x20225666
	# Extract MSB of $s0
	andi $s1,$s0,0xff000000		
	srl $s1,$s1,24		
	# Clear LSB of $s0
	andi $s0,$s0,0xffffff00
	# Set LSB of $s0
	ori $s0,$s0,0x000000ff
	# Clear $s0
	andi $s0,$s0,0x00000000	
