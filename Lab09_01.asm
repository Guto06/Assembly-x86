TITLE AUGUSTO GUASCHI MORATO RA:22008248

.model small
.Data
msg1 DB  10,10,' MAIOR',10,'$'
msg2 DB 10,' PARIDADE| IMPAR',10,'$'
msg3 DB 10,' PARIDADE| PAR',10,'$'
msg4 DB 10,' MENOR',10,'$'
msg5 DB'  UM NUMERO DE 0 ATE 9|','$'
msg6 DB'  OUTRO NUMERO TAMBEM DE 0 ATE 9|','$'
.code
main proc
    mov ax, @data
    mov ds,ax

    mov ah, 09   ; primeira mensagem 
    lea dx,msg5  ;
int 21h

    mov ah,01   ; ler e guarda o primeiro numero 
    mov dl,10
    INT 21h
    MOV BL,AL   ;

INT 21h

    MOV AH,09
    LEA DX,msg6 ; segunda mensagem 
    INT 21h
    
    MOV AH,01
   INT 21H 
   MOV BH,AL   ; ler e guarda o segundo numero 

    sub BL,30h  ; retira 30H de BL para ser lido como numero 
    sub BH,30h  ; retira 30h de BH para ser lido como numero 
    CMP BH,BL    ; compara os dois 
    JA BIG       ; caso BH for maior pular para BIG 
    XCHG BH,BL   ; caso BL seja maior trocar os valores dos dois 

BIG:

    MOV AH,09    ;
    LEA DX, msg1 ; para a mensagem de maior ser impressa 
    int 21H      ; 
    
    add bh,30h  ;
    mov dl,BH   ;
    mov ah,02   ; imprimir o BH
int 21H         ;
    add BH,0    ; identificar se BH é par ou impar 
    JP PAR      ; caso BH já seja par pular para PAR
    mov ah,09
    MOV DL,10
    lea dx,msg2 ; mensagem caso BH seja impar 
    int 21H
    jmp pul ; pular para pul para indentificar o maior e menor 
PAR:
    mov ah,09 
    MOV DL,10
    lea dx,msg3
INT 21h  ; imprime a mensagem se o primeiro numero é par ou impar 
pul:
    mov AH,09
    MOV DL,10
    LEA DX, msg4 ; mensagem de menor numero 
INT 21h

    ADD BL,30h;
    MOV DL,BL; imprimir BL 
    MOV AH,02;
INT 21h
    ADD BL,0 ; identificar se BL é impar ou par 
    JP IMPAR  ; caso BH já seja par pular para IMPAR
    MOV AH,09
    MOV DL,10
    LEA DX, msg2 ; MENSAGEM CASO BL SEJA IMPAR 
    INT 21H ; ler e imprimir 
    jmp FINAL ; pular para final para terminar o programa 
    
    IMPAR:
    MOV AH,09 
    MOV DL,10
    LEA DX,msg3 ; mensagem se o segundo numero e par ou impar  
    INT 21h; imprime 
    
    FINAL:
mov ah,4ch
int 21h
main endp ; ACABOU 
    end main




