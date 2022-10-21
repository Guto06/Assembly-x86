.model small
.Data
    msg DB  'Alo bem-vindos$'
.code
main proc
    mov AX,@Data 
    mov DS,AX
    mov AH,09
    mov DX,offset msg 
    Int 21H
    mov AH,4CH 
    int 21H
    main endp 
end main 
 