.MODEL SMALL 
.CODE 
MAIN PROC 
    MOV DS,AX 
    MOV AH,01H
    int 21h
    MOV BL,AL 
    MOV AH,02
    MoV DL,10
    INT 21H
    MOV AH,02
    MOV DL,BL
    int 21h
    MOV AH,4CH
    INT 21H
    MAIN ENDP    ;saida
END MAIN 