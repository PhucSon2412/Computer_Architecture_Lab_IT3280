.text
li $s1 3
li $s2 2
slt $at, $s2, $s1
beq $at, $zero, label 
addi $s3,$zero,1
j exit
label:
addi $s3,$zero,2
exit:
