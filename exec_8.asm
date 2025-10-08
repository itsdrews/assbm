.data
	array: 
		.align 2 # tipo int
		.space 40 # cada int tem 4 bytes (10 ints)
	msg: .asciiz " Digite numero:  "
	qn : .asciiz "\n"
	somaFinal: .asciiz "Soma final: "
.text
	li $t0, 0 # acumulador 
	li $t1,0 # contador
	li $t2,40 
	
	
	loop:
		beq $t1,$t2, saiDoLoop
		li $v0, 4
		la $a0, msg
		syscall  #imprime a msg
		# quebra de linha
		li $v0,4
		la $a0,qn
		syscall
		
		li $v0, 5
		syscall
		move $s0,$v0 # move o que esta em v0 pra s0
		sw $s0, array($t1) # guarda o vetor  na posicao 
		addi $t1,$t1,4
		j loop
		
		
	saiDoLoop:
		# agora vamos percorrer o array
		li $t1,0
		percorreArray:
			beq $t1,$t2,final
			lw $v0,array($t1)
			move $a0,$v0
			li $v0, 1 #imprime inteiro
			syscall
			add $t0,$t0,$a0
			#quebra de linha 
			li $v0,4
			la $a0,qn
			syscall
			addi $t1,$t1,4 
			# acumula somando 
			
			j percorreArray

			
		final:
			li $v0, 4
			la $a0, somaFinal
			syscall
			li $v0, 1
			move $a0,$t0
			syscall
			li $v0,10
			syscall
			
			
		