.data

	msg: .asciiz "Digite um numero de 1 a 9 para a tabuada:  \n"
	ql : .asciiz "\n"
	fim: .asciiz "\n Fim da tabuada"
	x: .asciiz " x "
	eq: .asciiz " = "

.text
	# exibe o texto
	li $v0, 4
	la $a0,msg
	syscall
	
	# leitura de inteiro
	li $v0,5
	syscall
	move $t0,$v0 # pega o que ta em v0 pra t0
	
	
	li $t1,1 #inicializa a tabuada
	li $t2, 0 # inicializa o resultado
	
	while: 
		beq $t1,11,exit
		move $a0,$t0
		li $v0,1 # numero
		syscall
		li $v0,4
		la $a0, x # x
		syscall
		move $a0,$t1 # numero
		li $v0, 1
		syscall 
		li $v0,4
		la $a0, eq # = 
		syscall 
		mul $t2,$t0,$t1 # multiplica
		move $a0,$t2 	# move t2 para v0
		li $v0,1 # imprime v0
		syscall	
		addi $t1,$t1,1
		li $v0,4
		la $a0,ql
		syscall
		j while
	exit:
		li $v0,4 
		la $a0,fim
		syscall
		li $v0,10
		syscall
	


