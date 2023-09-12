TITLE-------Nome: Augusto Guaschi Morato RA:22008248
.model small 
SOMETUDO MACRO      ;macro de apagar tudo da tela
        MOV AX,3
        INT 10H
    ENDM
Pular MACRO; macro para Pular Linha 
    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   
ENDM
    
.stack 100h
.data
    msg db 'Digite um caracter: $'
    msg2 db 'Oque foi digitado eh um numero :] $'
    msg3 db 'Oque foi digitado eh uma Letra minuscula :] $'
    msg4 db 'Oque foi digitado eh uma Letra maiuscula :] $'
    MSG5 db 'Oque foi digitado eh um Caractere estranho UE?? :P $'
.CODE
    MAIN proc
    SOMETUDO

    MOV AH,09
    MOV AL,' '
    MOV BH,15
	MOV BL,1AH     ;contem a cor de fundo no primeiro bit e a cor da letra no segundo bit
    MOV CX,200FH
    INT 10H

    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9 ;
    LEA DX,msg; exibe a mensagem na tela 
    INT 21h;

    MOV AH,1; Digita o caracter 
    INT 21h ;
    MOV BL,AL ; passa oque estava em AL para BL 

    CMP BL,48 ; comparamos oq está em  BL com 48 (o codigo de 0 em Decimal) caso seja menor nao eh numero
    JB LetraMi
    CMP BL,57   
    JA LetraMi ; caso o caracter for maior que 57 (numero 9 em Decimal) Pular para nao eh numero 

    Pular
    Pular

    MOV AH,9 ;
    LEA DX,msg2; exibe a mensagem na tela que o caractere eh Numero
    INT 21h;
    JMP FIM ; pula para o Final 

LetraMi:
    CMP BL,97 ;|a| com o codigo 97
    JB LetraMA; caso seja menor que 97 não será letra Minuscila,ira passar para a verificação da letra Maiuscula 
    CMP BL,122 ;|z| com o codigo 122
    JA LetraMA;por outro caso caso seja maior que 122 tambem não será letra Minuscula ira passar para a verificação da letra Maiuscula 
     Pular
     Pular
    MOV AH,9    ;
    LEA DX,msg3 ; Exibe a mensagem se eh Letra Minuscula
    INT 21h     ;
    JMP FIM ; pula para o Final
     
LetraMA:
CMP BL,65 ;|A|com o codigo 65
    JB Ué ;caso seja menor sera identificado como caracter desconnhecido
CMP BL,90 ; |B| com o codigo 90
    JA Ué; caso seja maior tmb será idendificado como um caracter

    Pular
    Pular

    MOV AH,9    ;
    LEA DX,MSG4 ; Exibe a mensagem se eh Letra Maiuscula
    INT 21h     ;
    JMP FIM ; pula para o Final

Ué:
    Pular
    Pular
    MOV AH,9 ;
    LEA DX,msg5; caso o caractere seja desconhecido sera ativada a mensagem
    INT 21h;

FIM:
    MOV AH,4Ch ; fim do Programa 
    INT 21h
MAIN ENDP 
    END MAIN