.model small
.code
main proc
    mov ah,02
    mov dl,'*'; MOSTRA OQ SE DEVE REPETIR NESTE CASO O *
    mov bl,10; LIMITA OS * EM GRUPOS DE 10
    rot: ; REPETE OS GRUPOS DE 10 , 5 VEZES 
    mov ah,01
    int 21H
    mov cl,5
    rot1:;POSSIVEL PULAR A LINHA 
    mov ah,02
    int 21h
    dec cl
    jnz rot1 ;FIM DA REPTIÇÃO PARA PULAR LINHA 
    dec bl
    jnz rot ;FINAL DA REPETIÇÃO DOS GRUPOS 

    mov ah,4ch
    int 21h
    main endp ; SAIDA 
end main
    