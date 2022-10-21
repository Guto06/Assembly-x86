.model small 
.code
main proc 
mov ah,1
int 21h
sub al,30h
mov bl,al
mov dl,45
mov ah,2
int 21h

mov ah,1
int 21H
sub al,30h ; funcao para ler o segundo 
mov bh,al
mov dl,61
mov ah,2
int 21H
sub bl,BH
mov dl,bh
add dl,30h ; fun?ao para somar 
mov ah,02
 int 21h
 
mov ah,4ch
int 21h 
main endp 
 end main  ; fun?ao para terminar 




 
