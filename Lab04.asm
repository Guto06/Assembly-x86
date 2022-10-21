model small  
.code 
main proc
 
mov AH,02
mov DL,65 ;65 ? o numero decimal que equivale a letra |A|
mov cl,13; o 13 ? utilizado para limitar o numero de letras que devem aparecer no cmd  

volta11:   ;cria uma sequencia de tarfeas a serem seguidas 
    int 21h
    inc dl   ; precisa incluir um novo dl 
    mov bl,dl; move oque esta em  DL para BL 
    mov dl,10; pular a linha 
    int 21h ; imprime o |pular linha|
    mov dl,bl; volta para DL
    dec cl ; limpa cl para poder colocar mais letras depois 
JNZ volta11 ; salto se n ? zero
    mov ah,01;le o caractere 
    mov cl,13 
    INT 21H ; printa os 13 primeiras letras do alfabeto MAIUSCULAS 
    mov ah,02 ; caractere saida padrao 

volta12:; A segunda parte do alfabeto em letra maiuscula
    int 21h
    inc dl
    mov bl,dl
    mov dl,10
    int 21h
    mov dl,bl
    dec cl
JNZ volta12
    mov ah,01
    INT 21H

inc dl
mov dl,97; 97 representa o numero decimal da letra|a| 
mov cl,13
mov ah,02
volta21:;inicio do alfabeto em letras minusculas primeira parte  
    int 21h
    inc dl
    mov bl,dl
    mov dl,10
    int 21h
    mov dl,bl
    dec cl
JNZ volta21

mov ah,01
mov cl,13
int 21h
mov ah,02

volta22: ; segunda parte alfabeto minusculo 
    int 21h
    inc dl
    mov bl,dl
    mov dl,10
    int 21h
    mov dl,bl
    dec cl
JNZ volta22

    mov ah,01
    mov cl,13
    int 21h
    mov ah,02

    inc dl
    mov dl,48 ; 48 ? o numero decimal do 0

    volta3:; inicio contagem 
    int 21h
    inc dl
    mov bl,dl
    mov dl,10
    int 21h
    mov dl,bl
    cmp dl,58
jnz volta3 

    mov ah,4ch
    int 21h
main endp
end main ; saida 

