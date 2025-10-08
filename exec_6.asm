.data
	str: .space 20
	msg: .asciiz "Digite algo de ate 20 caracteres: "
	ql: .asciiz "\n"
	resultado: .asciiz "String invertida: "
	

.text
	li $v0,4
	la $a0,msg # imprime mensagem
	syscall
	li $v0,8
	la $a0, str # buffer
	li $a1, 20 # quantidade de caracteres
	syscall
	
	# Calculando o tamanho da string 
	la $t0, str # carrega a str
	li $t1, 0 # inicializa contador do tamanho
	tamanhoLoop:
		lb $t2,0($t0) # loadbyte carreca para t2 o offset 0 do t0
		beq $t2,$zero fimTamanho #quando o byte for 0 acaba
		addi $t1,$t1,1 #incrementa tamanho
		add $t0,$t0,1 # incrementa offset
		j tamanhoLoop
		
	fimTamanho:
		la $t0,str # inicio
		add $t3,$t0,$t1 # ponteiro final (Tamanho da str)
		addi $t3,$t3,-1 # final real da string
	inverteLoop:
		bge $t0,$t3,fimInverte
		
		lb $t4, 0($t0) #carrega byte inicial
		lb $t5,0($t3) # carrega byte final
		
		sb $t5,0($t0) #store byte final no inicio
		sb $t4,0($t3) #store byte inicial no final
		
		addi $t0,$t0,1
		addi $t3,$t3,-1
		j inverteLoop
		
	fimInverte:
		li $v0,4
		la $a0,resultado
		syscall
		
		li $v0,4
		la $a0,str
		syscall
		
		li $v0,10
		syscall
		
