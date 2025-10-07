.data
	msg: .asciiz "Contagem de impares e pares"
	input: .asciiz "Digite inteiro: "
	pares: .asciiz "Quantidade de pares: "
	impares: .asciiz "Quantidade de impares: "
	n: .byte 10
	
.text
	li $v0,4
	la $a0,msg
	syscall
	
	li $t0, 0 # contador do progrma
	li $t2,2 # divisor
	li $t4,0 #contador de pares
	li $t5,0 #contador de impares 
	lb $t7,n #contaador n
	
	while:
		beq $t0,$t7,exit
		li $v0,4
		la $a0,input
		syscall
		li $v0,5
		syscall
		move $t3,$v0
		div $t3 ,$t2 #divide por 2
		mfhi $t6 # pega o valor do resto
		beq $t6,0,adicionapar # se o resto for igual a 0 pula para adiciona par
		# else adiciona 1 no impar e incrementa o contador do programa
		addi $t5,$t5,1
		addi $t0,$t0,1
		j while
		
		adicionapar:
			addi $t4,$t4,1 # soma 1 no ontador de pares
			addi $t0,$t0,1 #soma 1 no contador do programa 
			j while
		
		
	
	exit: 
		# Imprime a quantidade de pares
		li $v0,4 
		la $a0,pares
		syscall
		move $a0,$t4
		li $v0,1
		syscall
		# imprime a quantidade de impares
		li $v0,4 
		la $a0,impares
		syscall
		move $a0,$t5
		li $v0,1
		syscall
		
		li $v0, 10
		syscall
		
		
	
	
	

