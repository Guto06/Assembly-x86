.model small
.code 

    main proc 
        mov al, 6
        mov bl, 6
        neg al ; al vira negativo
        neg bl ; bl vira negativo 
        add al,bl ; (-al)+(-bl)
       
        mov ah,4ch 
        int 21H
        main endp ; fim
 end main       
