;Nome:Augusto Guaschi Morato RA:22008248

model SMALL
SOMETUDO MACRO      ;macro de apagar tudo da tela
        MOV AX,3
        INT 10H
    ENDM
.DATA
msg db 'Digite um caracter:$' ;Frase que deve aparecer na tela 
msg1 db 'Caractere digitado:$'
.CODE
main proc
; permite utilizar os dados salvos no .data
    SOMETUDO

    MOV AH,0
    MOV AL,06h  
    INT 10H
    MOV AH,0BH
    MOV BH,00H       
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

    MOV AH,1; Salva o caracter digitado 
    INT 21h ;

    MOV BL,AL ; passa oque estava em AL para BL 
    MOV AH,2
    MOV DL,10 ; pular a linha 
    INT 21h   ;

    MOV AH,9    ;
    LEA DX,msg1 ; Exibe a mensagem salva em msg1 na tela 
    INT 21h     ;

    MOV AH,2  ;
    MOV DL,BL ;impreime o caracter salvo  
    INT 21h   ;  

    MOV AH,4Ch ; fim do Programa 
    INT 21h

main endp
end main 