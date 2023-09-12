;Nome: Augusto Guaschi Morato RA:22008248
.model small
SOMETUDO MACRO      ;macro de apagar tudo da tela
        MOV AX,3
        INT 10H
    ENDM 
.stack 100h
.data
    msg db 'Digite uma Letra Minuscula: $'
    msg2 db 'Letra Maiuscula: $'
    .CODE
    MAIN proc
    SOMETUDO
    MOV AH,0
    MOV AL,06h  
    INT 10H
    MOV AH,0BH
    MOV BH,03H       
    MOV BL,06h        ;cor de fundo
    INT 10H
    MOV AH,03H   
    MOV BH,0       ;funcao para trocar a cor das letras
    MOV BL,0         ;seleciona a paleta 0
    INT 10H
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9 ;
    LEA DX,msg; exibe a mensagem na tela 
    INT 21h;

    MOV AH,1; Salva a LETRA digitada 
    INT 21h ;
    SUB AL,32 ;SUBTRAI 32 DE AL PARA TRANSFORMAR EM MAIUSCULA 
    MOV BL,AL ; passa oque estava em AL para BL 
    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   ;

    MOV AH,9    ;
    LEA DX,msg2 ; Exibe a mensagem salva em msg1 na tela 
    INT 21h     ;

    MOV AH,2  ;
    MOV DL,BL ;impreime a letra na forma maiuscula 
    INT 21h   ;  

    MOV AH,4Ch ; fim do Programa 
    INT 21h
    MAIN ENDP 
    END MAIN