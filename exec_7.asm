.data
	msg: .asciiz "Digite um numero: "
	media: .asciiz "A média é: "
	zero_float: .float 0.0

.text 
	
	li $t0,0 # Contador
	la $t1,zero_float #carrega endereco
	l.s $f2,0($t1) # inicializa o Acumulador
	li $t3,4 # maximo de iteracoes
	
	loop:
		beq $t0,$t3,saiDoLoop
		la $a0,msg # carrega a msg
		jal imprimeStr   # chama a funcao 
		li $v0,6
		syscall
		add.s $f2,$f2,$f0
		j loop
	saiDoLoop:
		#converter 4 para flota 
		mtc1 $t3,$f4
		cvt.s.w $f4,$f4 # Convert to single precision (float) from word (inteiro)
		
		#calcular a media 
		div.s $f12,$f2,$f4 #guarda em f12 a divisao de f2 por f4 (acc/4)
		
		la $a0,media
		jal imprimeStr
		
		li $v0,2 # a impressao de float e em $f12
		syscall
		
		li $v0, 10
		syscall
	imprimeStr: # Imprime o que estiver no $a0
		li $v0,4
		syscall
		jr $ra
	
		
