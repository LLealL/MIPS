#Still Working on this macro list
#Some Macros may not work
.macro print_int(%x)
	li $a0,%x
	li $v0,1
	syscall
.end_macro 

.macro print_float(%x)
	li $f12,%x
	li $v0,2
	syscall
.end_macro 

.macro print_double(%x)
	li $f12,%x
	li $v0,3
	syscall
.end_macro 

.macro print_string(%x)
	li $a0,%x
	li $v0,4
	syscall
.end_macro 

.macro read_int()
	li $v0,5
	syscall
.end_macro 

.macro read_float()
	li $v0,6
	syscall
.end_macro

.macro read_double()
	li $v0,7
	syscall
.end_macro 

.macro read_string(%x,%y)
	li $a0,%x
	li $a1,%y
	li $v0,8

.end_macro 

.macro newHeapMemory(%x)
	li $a0,%x
	li $v0,9
	syscall
.end_macro 

.macro exit()
	li $v0,10
	syscall
.end_macro 

.macro print_char(%x)
	li $a0,%x
	li $v0,11
	syscall
.end_macro 

.macro read_char
	li $v0,12
	syscall
.end_macro 

.macro fopen(%x,%y,%z)
	add $a0,$zero,%x
	li $a1,%y
	li $a2, %z
	li $v0,13
	syscall
.end_macro 

.macro fread()(%x,%y,%z)
	add $a0,$zero,%x
	li $a1,%y
	li $a2,%z
	li $v0,14
	syscall

.end_macro 

.macro fwrite(%x,%y,%z)
	add $a0,$zero,%x
	li $a1,%y
	li $a2,%z
	li $v0,15
	syscall

.end_macro 

.macro fclose(%x)
	add $a0,$zero,%x
	li $v0,16
	syscall
.end_macro 

.macro exit2(%x)

.end_macro 

.macro SysTime()

.end_macro 

.macro MIDIout(%x,%y,%w,%z)

.end_macro 

.macro sleep(%x)

.end_macro 

.macro SyncMIDIout(%x,%y,%w,%z)

.end_macro 

.macro PrintInt2Hex(%x)

.end_macro 

.macro PrintInt2bin(%x)

.end_macro 

.macro PrintInt2u(%x)

.end_macro 

.macro setSeed(%x,%y)

.end_macro 

.macro randomInt(%x)

.end_macro 

.macro randomIntRange(%x,%y)

.end_macro 

.macro randomFloat(%x)

.end_macro 

.macro randomDouble(%x)

.end_macro 

.macro GetInputInt(%x)

.end_macro 

.macro GetInputDouble(%x)

.end_macro 

.macro GetInputString(%x,%y,%z)

.end_macro 

.macro MsgDialog(%x,%y)

.end_macro 


.macro MsgDialogInt(%x,%y)

.end_macro 

.macro MsgDialogFloat(%x,%y)

.end_macro 

.macro MsgDialogDouble(%x,%y)

.end_macro 

.macro MsgDialogString(%x,%y)

.end_macro 
