.model small
.code 

    main proc 
        mov al, 8
        mov bl, 3
        neg al ;al negativo
        neg bl; bl negativo
        sub al,bl ;(-al)-(-bl)
       
        mov ah,4ch 
        int 21H
        main endp ;fim
 end main       
