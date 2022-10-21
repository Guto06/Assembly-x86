
.model small
.code
main proc
    mov ah,02
    mov dl,'*'
    mov cx,10
    rot: ; INICIO DE UMA SEQUENCIA DE TAREFAS QUE VÃO SER SEGUIDAS 
    mov ah,01
    int 21H
    mov bl,5
    rot1:; SEQUENCIA DE TARREFAS QUE VÃO SER SEGUIDAS (DENTRO DE OUTRA SEQUENCIA)
    mov ah,02
    int 21h
    dec bl
    jnz rot1;POSSIVEL PULAR LINHA 
    loop rot ;como o lopp e possivel ter repetiçao 

    mov ah,4ch
    int 21h
    main endp ; SAIDA 
end main
    