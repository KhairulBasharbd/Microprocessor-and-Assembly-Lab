
include emu8086.inc
.model small
.stack 100h

.data

    msg1 db "input : $"
    msg2 db "first capital : $"  
    msg3 db "last capital : $" 
    first db 91
    last db 64

.code

main proc 
         
         mov ax,@data
         mov ds,ax  
         
         lea dx,msg1
         mov ah,9
         int 21h 
         
     input:    
         mov ah,1
         int 21h
         cmp al,0dh
         je break
         cmp al,64
         jle input
         cmp al,91
         jge input 
         
     ch_f:
         cmp al,first
         jge ch_l  
         mov first,al
         
     ch_l:
         cmp al,last
         jle input
         mov last,al
         
         
    
      break:
            printn '' 
            lea dx,msg2
            mov ah,9
            int 21h 
    
            mov ah,9 
            lea dx,msg1
            int 21h  
            
            
    
    
    
    
            
      stop:
            mov ah,4ch
            int 21h
            
    
main endp

