.data
	# int fun(int a, int b, int c , int e, int f);
	# int a,p,q,z,w,v[N].
	# x = fun(16*a, z*w, gun(p,q,r,s), v[3],v[z], z-2);
	
	a: .word # (ints)
	p: .word
	q: .word
	z: .word
	w: .word 
	N: .word 
	v:
		.align 2
		.space N # deve ser multiplicado por 4 bytes para ter o tamanho certo
.text 
	
	
	# primeiro argumento: $a0
	lw $t0,a # t0 = a
	li $t1,16 # t1 = 16
	mul $a0, $t0,$t1 # a0 = a*16
	
	# segundo argumento: z*w 
	lw $t2,z #t2 = z
	lw $t3,w #t3 = w
	mul $a1, $t2,$t3 # a1 = z* w
	
	# terceiro argumento: gun(p,q,r,s)
	lw $a0,p
	lw $a1,q
	lw $a2,r
	lw $a3,s
	jal gun # chamada da função gun com os parametros p q r s
	move $a2, $v0 # captura o resultado para a2 que estava em v0
	
	# quarto argumento : v[3]
	la $t4,v #carrega o vetor 
	lw $a3,12($t4) # offset de 12 no vetor (3x4= 12) ou seja 3 posições
	
	# quinto e sexto argumentos: v[z] e z-2
	lw $t5,v #carrega vetor
	sll $t5,$t5,2 # multiplica por 2^2
	la $t6,v 
	add $t5,$t5,$t6
	lw $t7, 0($t5) #t7 = v[z]
	addi $sp,$sp, -8  # cria espaço para 2 argumentos extras
	sw $t7,0($sp) # quinto argumento
	lw, $t8,z
	addi $t8,$t8,-2
	sw $t8,4 ($sp) # sexto argumento 
	
	#chama  fun
	
	jal fun	
	
	# guarda resultado da pilha da função em x
	lw $t9,x
	sw $v0,x
	
	# necessario ajustar a stack de argumentos de volta
	addi $sp, $sp,8