.model small
.stack 100h
.data

msg1 db 'Enter single digit : $'

msg2 db 0dh,0ah,'Even $'  
msg3 db 0dh,0ah,'Odd $'


.code
main proc 
    
         mov ax,data
         mov ds,ax
         
         mov ah,9
         lea dx,msg1
         int 21h
         
         mov ah,1
         int 21h
         sub al,48         
         
         xor ah,ah
         mov bl,2
         div bl
         cmp ah,0
         je even
         jmp odd
         
   even:       
         mov ah,9
         lea dx,msg2
         int 21h
         jmp exit
   odd:      
        mov ah,9
         lea dx,msg3
         int 21h
    
    
   exit:
    mov ah,4ch
    int 21h
    
    
main endp