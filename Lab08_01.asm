.model small
.code 

    main proc 
        mov al, 6
        mov bl, 4
        sub al,bl ; Al-bl
       
        mov ah,4ch 
        int 21H
        main endp ; encerramento
 end main       

