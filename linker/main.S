.code16
.text
.global __start

__start:
    jmp real_start
    nop

   
    # Dejamos 87 bytes de espacio para que la BIOS no sobrescriba nuestro código
    .space 87

real_start:
    # Inicialización limpia
    xor %ax, %ax
    mov %ax, %ds
    mov %ax, %es
    xor %bh, %bh

    #  Imprimir
    mov $msg, %si
    mov $0x0e, %ah

loop:
    lodsb
    or %al, %al
    jz halt
    int $0x10
    jmp loop

halt:
    hlt
    jmp halt

msg:
    .asciz "hello world"