.section .data
    quocient: .word 0                           # Declara uma variável 'quocient' com valor do quociente

    success_msg: .asciz "É potência de 2\n"     # Mensagem exibida quando o número for potência de 2
    success_msg_len = . - success_msg           # Calcula o tamanho da mensagem de sucesso

    fail_msg: .asciz "Não é potência de 2\n"    # Mensagem exibida quando o número não for potência de 2
    fail_msg_len = . - fail_msg                 # Calcula o tamanho da mensagem de erro

.section .text
    .globl main                                 # Declara a função main como global (ponto de entrada do programa)

main:
                                                # Verifica se um número é potência de 2 usando a operação q & (q - 1)
    movw quocient, %ax                          # Move o valor armazenado em 'quocient' para o registrador AX
    cmpw $0, %ax                                # Compara AX com 0
    jle fail                                    # Se AX <= 0, pula para a label 'fail' (não é potência de 2)

    decw %ax                                    # Decrementa AX (q - 1).
    andw quocient, %ax                          # Faz uma operação lógica AND entre (q - 1) e q
    je success                                  # Se o resultado for 0, pula para 'success' (é potência de 2)

fail:
    movl $4, %eax                               # Código da syscall para 'sys_write' (escreve no terminal)
    movl $1, %ebx                               # File descriptor 1 (saída padrão)
    movl $fail_msg, %ecx                        # Endereço da mensagem de erro
    movl $fail_msg_len, %edx                    # Tamanho da mensagem de erro
    int $0x80                                   # Chama a interrupção do sistema para escrever no terminal

    jmp exit                                    # Pula para a saída do programa

success:
    movl $4, %eax                               # Código da syscall para 'sys_write' (escreve no terminal)
    movl $1, %ebx                               # File descriptor 1 (saída padrão)
    movl $success_msg, %ecx                     # Endereço da mensagem de sucesso
    movl $success_msg_len, %edx                 # Tamanho da mensagem de sucesso
    int $0x80                                   # Chama a interrupção do sistema para escrever no terminal

exit:
    movl $1, %eax                               # Código da syscall para 'sys_exit' (sair do programa)
    xorl %ebx, %ebx                             # Define EBX como 0 (status de saída)
    int $0x80                                   # Chama a interrupção do sistema para encerrar o programa

