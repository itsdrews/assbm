.data
    msg1: .asciiz "Digite sua idade: "
    msgMenor: .asciiz "Voce eh menor de idade.\n"
    msgMaior: .asciiz "Voce eh maior de idade.\n"
    msgIdoso: .asciiz "Voce eh idoso.\n"

.text
.globl main

main:

    li $v0, 4          
    la $a0, msg1
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0      

    
    li $t1, 18
    blt $t0, $t1, menor 

   
    li $v0, 4
    la $a0, msgMaior
    syscall

   
    li $t2, 60
    blt $t0, $t2, fim   
    li $v0, 4
    la $a0, msgIdoso
    syscall
    j fim

menor:
 
    li $v0, 4
    la $a0, msgMenor
    syscall
    j fim

fim:
    li $v0, 10         
    syscall
