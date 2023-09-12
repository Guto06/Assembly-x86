;Nome:Augusto Guaschi Morato RA:22008248
.MODEL SMALL
.STACK 100h
.DATA
MSG1 DB 'boa tarde $'
MSG2 DB 10,13,'Legal$'
.CODE
main proc
; Permite o acesso às variáveis definidas em .DATA
MOV AX,@DATA
MOV DS,AX
; Exibe na tela a string MSG1
MOV AH,9
LEA DX,MSG1
INT 21h
; Exibe na tela a string MSG2
MOV AH,9
LEA DX,MSG2
INT 21h
; Finaliza o programa
MOV AH,4Ch
INT 21h
main endp 
end main