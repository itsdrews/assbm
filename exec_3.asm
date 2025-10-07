.data

	msg: .asciiz "Digite uma quantidade de entradas: "
	msg2: .asciiz "Digite numero: "
	msg3: .asciiz "Resultado da soma dos numeros inputados: "
.text
	# imprime msg na tela pedindo o número inteiro do usuário.
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5 # Leitura de inteiros
	syscall
	
	move $t0,$v0 #guarda o valor de v0 em t0
	addi $t1,$zero,0 # contador
	addi $t2, $zero,0 # acumulador
	while:
		beq $t1,$t0,exit 
		li $v0,4
		la $a0,msg2 #exibe msg 
		syscall
		li $v0,5 # le inteiro
		syscall 
		move $t3,$v0 # move para t3 
		add $t2,$t2,$t3
		addi $t1,$t1,1 # adiciona no contador
		
		
		j while
	
	exit:
		li $v0,4
		la $a0,msg3
		syscall
		move $a0,$t2
		li $v0,1
		syscall
		
		
	
	