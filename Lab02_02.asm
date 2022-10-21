.MODEL SMALL
.DATA 

    POT DB 10,0, '$$$$$$$$$$$$'
    .CODE
    main proc
    MOV AX,@DATA    ; inico da DS
    MOV DS,AX
    MOV AH,0Ah
    MOV DX,OFFSET POT
    INT 21H
    MOV AH,02
    MOV DL,10
    INT 21H
    MOV AH,9          ; fun?ao para escrita da string 9
    MOV DX,OFFSET POT ; endere?o string
     add dx,2
    INT 21H
    MOV AH,4CH  ;saida
    INT 21H
main endp
END main