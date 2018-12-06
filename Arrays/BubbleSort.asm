.data
	V: .word 5, 4, 3, 2, 1, 10, 22, 41, 55, 45
	virg: .asciiz ","
.text

	MAIN:	
		la $s0,V
		addi $sp,$sp,-8
		sw $s0,0($sp)
		add $a0,$zero,$s0
		Jal GetVTam
		lw $s0,0($sp)
		addi $t0,$zero,0
		add $t1,$zero,$v0
		sw $v0,4($sp)
		addi $t1,$t1,-1
		
		W1: 
			slt $t2,$t0,$t1
			beq $t2,$zero,FimW1
			addi $sp,$sp,-4
			
			sw $t0,0($sp)
			addi $t2,$zero,0
				
			W2:
				slt $t3,$t2,$t1
				beq $t3,$zero,FimW2
				add $a0,$zero,$t2
				addi $a1,$t2,1
				add $a2,$zero,$s0
				addi $sp,$sp,-8
				sw $t2,0($sp)
				sw $t1,4($sp)
				jal Compare
				
				lw $t2,0($sp)
				lw $t1,4($sp)
				addi $t2,$t2,1
				addi $sp,$sp,8
				J W2
							
			FimW2:
			
			lw $t0,0($sp)
			addi $t1,$t1,-1
			addi $sp,$sp,4
			
 		 	J W1		
		FimW1:
			
		add $t0,$zero,0
		lw  $t1,4($sp)
		lw $s0,0($sp)
		addi $t1,$t1,-1
		
	 	 	W3:
	   			slt $t2,$t0,$t1
	   			beq $t2,$zero,FIMMAIN
	   			add $v0,$zero,1
	   			add $t3,$t0,$t0
	   			add $t3,$t3,$t3
	   			add $t3,$s0,$t3
	   			lw $a0,0($t3)
	   			syscall
	   			
	   			addi $v0,$zero,11
	   			addi $a0,$zero,44
	   			syscall
	   			
	   			addi $t0,$t0,1
	   			
	   			J W3
		FIMMAIN:
		
		addi $sp,$sp,8
		addi $v0,$zero,10
		syscall


GetVTam: # $a0= V[] $v0=tamanho vetor
	addi $sp,$sp,-4
	sw $ra,0($sp)
	addi $t0,$zero,0
	add $t2,$zero,$a0
	addi $v0,$zero,0
	
	TamW1:
		lw $t1,0($t2)
		ERETURN:
		beq $t1,$zero,EndTamW1
		addi $v0,$v0,1
		addi $t2,$t2,4
		J TamW1
		
	EndTamW1:
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
		

Compare: # $a0 = A , $a1 = B , $a2=V[] if v[A]>v[B] then Change A<->B
	
	add $t0,$a0,$a0
	add $t0,$t0,$t0
	add $t1,$a2,$t0
	add $t0,$a1,$a1
	add $t0,$t0,$t0
	add $t0,$t0,$a2
	
	lw $t2, 0($t0)
	lw $t3,0($t1)
	
	slt $t4,$t2,$t3
	beq $t4,$zero,FimCompare
	
	sw $t3,0($t0)
	sw $t2,0($t1)
	
	FimCompare:
	
	jr $ra


.ktext 0x80000180

	move $k0,$v0
	move $k1,$a0
	la $a0,msg
	li $v0,4
	syscall
	move $v0,$k0
	move $a0,$k1
	mfc0 $k0,$14
	addi $k0,$k0,4
	mtc0 $k0,$14
	eret
	.kdata
	msg: .asciiz "trap gerada"
