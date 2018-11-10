.data
	texto : .asciiz "digite o numero da posição do elemtento na sequencia fibonacci" 
.text


.macro Getinput
	la $a0,texto
	li $v0,51
	syscall
.end_macro


.macro print_int(%x)

	li $v0,1
	add $a0,$zero,%x
	syscall
.end_macro

	Getinput
 	
  	addi $t0 ,$zero,0
	addi $t1,$zero,1
	add $t3,$zero,$a0
	addi $t2,$zero,0
W1:
	slt $t4,$t2,$t3
	beq $t4,$zero,Fim
	add $t5,$t0,$t1
	add $t0,$zero,$t1
	add $t1,$zero,$t5
	addi $t2,$t2,1
	j W1

Fim:
	
	print_int($t5)

	
