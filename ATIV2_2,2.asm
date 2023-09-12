;Nome: Augusto Guaschi Morato RA:22008248
.model small 
SOMETUDO MACRO      ;macro de apagar tudo da tela
        MOV AX,3
        INT 10H
    ENDM
.stack 100h
.data
    msg db 'Digite um primeiro numero: $'
    msg2 db 'DIgite o segundo numero: $'
    msg3 db 'A soma dos dois numero: $'
    .CODE
    MAIN proc
    SOMETUDO

    MOV AH,0
    MOV AL,06h  
    INT 10H
    MOV AH,0BH
    MOV BH,05H       
    MOV BL,08h        ;cor de fundo
    INT 10H
    MOV AH,0FH   
    MOV BH,1          ;funcao para trocar a cor das letras
    MOV BL,0          ;seleciona a paleta 0
    INT 10H
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9 ;
    LEA DX,msg; exibe a mensagem na tela 
    INT 21h;

    MOV AH,1; Salva o numero digitado "ele ainda esta como caracter"
    INT 21h ;
    SUB AL,48 ;subtrair 48 para transformar caractere em numero 
    MOV BL,AL ; passa oque estava em AL para BL 

    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   ;

    MOV AH,9 ;
    LEA DX,msg2; exibe a mensagem na tela 
    INT 21h;

    MOV AH,1; Salva o numero digitado
    INT 21h ;
    SUB AL,48 ;subtrai 48 de AL para transforma de caracter para numero
    ADD BL,AL ; passa oque estava em AL para BL  
    ADD BL,48 ; adiciona 48 para transformar em caracter 
    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   ;

    MOV AH,9    ;
    LEA DX,msg3 ; Exibe a mensagem salva em msg3 na tela 
    INT 21h     ;

    MOV AH,2  ;
    MOV DL,BL ;impreime o resultado da soma 
    INT 21h   ;  

    MOV AH,4Ch ; fim do Programa 
    INT 21h
    MAIN ENDP 
    END MAIN