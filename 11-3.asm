.data
	# int fun(int a, int b, int c , int e, int f);
	# int a,p,q,z,w,v[N].
	# x = fun(16*a, z*w, gun(p,q,r,s), v[3],v[z], z-2);
	
	a: .word 1
	p: .word 2
	q: .word 3
	r: .word 4
	s: .word 5
	z: .word 3      # <= use 3 pra não acessar fora do vetor
	w: .word 7
	x: .word 0
	v: .word 10,20,30,40,50  # Vetor v[0..4]

.text
.globl main

main:
	# primeiro argumento: 16 * a
	lw $t0, a
	li $t1, 16
	mul $a0, $t0, $t1      # a0 = 16*a
	
	# segundo argumento: z * w 
	lw $t2, z
	lw $t3, w
	mul $a1, $t2, $t3      # a1 = z*w
	
	# terceiro argumento: gun(p,q,r,s)
	lw $a0, p
	lw $a1, q
	lw $a2, r
	lw $a3, s
	jal gun
	move $a2, $v0          # a2 = retorno de gun
	
	# quarto argumento: v[3]
	la $t4, v
	lw $a3, 12($t4)        # 3*4 = 12 bytes (v[3])
	
	# quinto argumento: v[z]
	lw $t5, z
	sll $t5, $t5, 2        # z * 4
	la $t6, v
	add $t5, $t5, $t6
	lw $t7, 0($t5)         # t7 = v[z]

	# sexto argumento: z - 2
	lw $t8, z
	addi $t8, $t8, -2

	# empilha argumentos extras
	addi $sp, $sp, -8
	sw $t7, 0($sp)         # v[z]
	sw $t8, 4($sp)         # z - 2
	
	# chama fun
	jal fun
	
	sw $v0, x              # x = resultado
	addi $sp, $sp, 8       # restaura pilha

	# imprime resultado final
	li $v0, 1
	lw $a0, x
	syscall

	# finaliza programa
	li $v0, 10
	syscall


# Função gun: soma p + q + r + s
gun:
	add $v0, $a0, $a1
	add $v0, $v0, $a2
	add $v0, $v0, $a3
	jr $ra


# Função fun: soma todos os argumentos
fun:
	add $v0, $a0, $a1
	add $v0, $v0, $a2
	add $v0, $v0, $a3

	lw $t0, 0($sp)     # quinto argumento
	lw $t1, 4($sp)     # sexto argumento
	add $v0, $v0, $t0
	add $v0, $v0, $t1

	jr $ra
