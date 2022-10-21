.model small
.Data
    msg DB  'Alo bem-vindos',13,10,'$$'
.code
main proc          ;INICIO FUN??O PRINCIPAL
    mov AX,@Data  
    mov DS,AX
    mov AH,09
    mov DX,offset msg    ; INICIALIZA??O DA STRING
    MOV CL,10
    VOLTA:
    Int 21H
    DEC CL
    JNZ VOLTA 
    mov AH,4CH 
    int 21H
    main endp         ; SAIDA
end main 
 