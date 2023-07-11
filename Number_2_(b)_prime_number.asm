.model small
.stack 100h
.data

msg1 db 'Enter single digit : $'                                          .model small
.stack 100h
.data

msg1 db 'Enter single digit : $'

msg2 db 0dh,0ah,'Prime $'  
msg3 db 0dh,0ah,'Not prime $'


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
         
         mov ah,0
         mov bx,ax
         
         mov cx,ax
         cmp cx,1
         jle not_prime
         
         dec cx
         top:
            
            cmp cx,1
            jle prime
            div cl
            cmp ah,0
            je not_prime
            mov ax,bx
            dec cx
            jmp top         
         
         prime:
            mov ah,9
            lea dx,msg2
            int 21h
            jmp exit 
            
        not_prime:
             mov ah,9
            lea dx,msg3
            int 21h
    
    
   exit:
    mov ah,4ch
    int 21h
    
    
main endp

