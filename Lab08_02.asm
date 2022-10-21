.model small
.code 

    main proc 
        mov al, 7
        mov bl, 2
        add al,bl; Al mais Bl
       
        mov ah,4ch 
        int 21H
        main endp ; fim
 end main    