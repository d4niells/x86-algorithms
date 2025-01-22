.section .data
    quocient: .word 8 
 
    success_msg: .asciz "É potência de 2\n"
    success_msg_len = . - success_msg

    fail_msg: .asciz "Não é potência de 2\n"
    fail_msg_len = . - fail_msg

.section .text
    .globl main

main:
    # q & (q - 1)
    movw quocient, %ax
    cmpw $0, %ax
    je fail

    decw %ax
    andw quocient, %ax
    je success
    
fail:
    movl $4, %eax
    movl $1, %ebx
    movl $1, %ebx
    movl $fail_msg, %ecx
    movl $fail_msg_len, %edx
    int $0x80

    jmp exit

success:
    movl $4, %eax
    movl $1, %ebx
    movl $success_msg, %ecx
    movl $success_msg_len, %edx
    int $0x80

exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
