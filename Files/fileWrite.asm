.data
	file: .asciiz "/.../MIPS/Files/data.dat" #specify your Directory
	buffer: .space  32
	msgInputTxt: .asciiz "Enter with your string data"
	OpenfileErr: .asciiz "Failed to open File [syscall failed]\n"
	FileOpened: .asciiz "Sucessfully opened the file\n"
	
		
	
.macro openFileToWrite(%x)
	addi $a1,$zero,9
	li $a2,0
	addi $v0,$zero,13
	add $a0,$zero,%x
	syscall
	
	
.end_macro  

.macro closeFile(%x)
	addi $v0,$zero,16
	add $a0,$zero,%x
	syscall
.end_macro 

.macro readFile(%x,%y)
	addi $v0,$zero,14
	add $a0,$zero,%x
	add $a1,$zero,%y
	addi $a2,$zero,32
	syscall
.end_macro 

.macro WriteFile(%x,%y)
	addi $v0,$zero,15
	add $a0,$zero,%x
	add $a1,$zero,%y
	addi $a2,$zero,32
	syscall
.end_macro

.macro GetFileInput(%x)
	addi $v0,$zero,54
	la $a0,msgInputTxt
	add $a1,$zero,%x
	addi $a2,$zero,32
	syscall
		
.end_macro 

.macro PrintText(%x)
 	addi $v0,$zero, 4
 	add $a0,$zero,%x
 	syscall
 	
.end_macro 


.text

main:
	la $s0,file
	openFileToWrite($s0)	
	add $s2,$zero,$v0
	la $s1,buffer
	GetFileInput($s1)
	PrintText($s1)
	WriteFile($s2,$s1)
	closeFile($s2)
	
	




