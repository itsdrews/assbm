.data

	array: 
		.align 2 # inteiros
		.space 24 # 6 x 4 = 24 bytes
		
	msg: 
		.asciiz "Digite numero: "
	ql:
		.asciiz "\n"
		
	pares: .asciiz "pares: "
	impares: .asciiz "impares: "

.text
	li $s4, 0 # contador de pares
	li $s5, 0 # contador de impares
	li $t0, 0 # contador do loop
	li $t1, 24 # n
	
	loop:
		beq $t0,$t1,saiDoLoop
		#####
		li $v0,4 
		la $a0, msg
		syscall ## msg e quebra de linha
		li $v0, 4
		la $a0, ql
		#####
		syscall
		li $v0,5 # leitura de inteiro
		syscall
		move $s0, $v0 #mover para o s0 o que esta em v0
		sw $s0,array($t0)
		addi $t0,$t0,4 # offset de 4 
		j loop
		
	saiDoLoop:
		li $t0,0
		li $t5,0 # valor de ref para divisao
		percorreArray:
			beq $t0,$t1,saiArray
			lw $s0,array($t0)
			li $t2,2 # divisor (2)
			move $t3,$s0  # pega o valor t3 que estava em s0
			div $t3,$t2 # divide por 2
			mfhi $t4 # pega o resto para t4
			beq $t4,$t5,somaPar
			addi $s5,$s5,1
			addi $t0,$t0,4
			j percorreArray
			
			
			somaPar: 
				addi $s4,$s4,1
				addi $t0,$t0,4
				j percorreArray
			
			
		saiArray:
			li $v0,4
			la $a0, pares
			syscall
			li $v0,1
			move $a0,$s4
			syscall
			li $v0,4
			la $a0, ql
			syscall
			li $v0,4
			la $a0, impares
			syscall
			li $v0, 1
			move $a0,$s5
			syscall
			li $v0, 10
			syscall
			
			
	
	
	
	