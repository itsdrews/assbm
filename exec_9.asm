.data
	array: .word 100,2,3,4,50,6,7,8 # Array com elementos já definidos
	maior: .asciiz "Maior elemento: " # 8x4= 32
.text	
	li $t0, 0 # contador
	li $t1, 32 # final do offset do array
	lw $s0,array($t0) # o maior elemento é o primeiro do array antes do loop
	move $t3,$s0 # move para t3
	
	loop:
		beq $t0,$t1,saiLoop
		lw $s0,array($t0)
		move $t4,$s0
		bgt $t4,$t3,mudaMaior
		
		addi $t0,$t0,4
		j loop
		
		
		mudaMaior: 
			move $t3,$t4
			addi $t0,$t0,4
			j loop
		
		
	saiLoop:
		li $v0,4
		la $a0,maior
		syscall
		li $v0,1
		move $a0, $t3
		syscall
		li $v0, 10
		syscall
		
		
	
	