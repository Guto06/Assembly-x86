TITLE-------Nome: Augusto Guaschi Morato RA:22008248
.model small 
SOMETUDO MACRO      ;macro de apagar tudo da tela
        MOV AX,3
        INT 10H
    ENDM
Pular MACRO
    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   
ENDM
    

.stack 100h
.data
    msg db 'Digite um caracter: $'
    msg2 db 'Oq foi Digitado eh um Numero $'
    msg3 db 'Oq foi Digitado nao eh um Numero $'
.CODE
    MAIN proc
    SOMETUDO

    MOV AH,09
    MOV AL,' '
    MOV BH,15
	MOV BL,3FH     ;contem a cor de fundo no primeiro bit e a cor da letra no segundo bit
    MOV CX,200FH
    INT 10H

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9 ;
    LEA DX,msg; exibe a mensagem na tela 
    INT 21h;

    MOV AH,1; 
    INT 21h ;
    MOV BL,AL ; passa oque estava em AL para BL 

    CMP BL,48 ; comparamos oq está em  BL com 48 (o codigo de 0 em Hexa) caso seja menor nao eh numero
    
    JB NopNumero
    
    CMP BL,57   
    JA NopNumero ; caso o caracter for maior que 57 (numero 9 em Hexa) Pular para nao eh numero 

    Pular
    Pular

    MOV AH,9 ;
    LEA DX,msg2; exibe a mensagem na tela que o caractere eh numero 
    INT 21h;

    JMP FIM ; pula para o Final 

   NopNumero:
     Pular
     Pular
    MOV AH,9    ;
    LEA DX,msg3 ; Exibe a mensagem salva em msg3 na tela 
    INT 21h     ;
   

FIM:
    MOV AH,4Ch ; fim do Programa 
    INT 21h
MAIN ENDP 
    END MAIN

