include emu8086.inc

.model small
.stack 100h
.data
       input_msg  db "input : $"
       msg1 db "First Capital : $"
       msg2 db "Last Capital : $"  
       
       first db '[' 
       last db '@'

.code
main proc
                mov  ax, @data
                mov  ds, ax
      
      
                lea  dx, input_msg
                mov  ah,9
                int  21h
         
       input:  
                mov  ah, 1
                int  21h
                cmp  al, 0dh
                je   break 
                
                cmp al,65
                jl next 
                
                cmp al,90
                jg next
                
                cmp al,first
                jge check_last 
                mov first,al 
                
          check_last:      
                cmp al,last
                jle next
                mov last,al
                 
                
          next:
                jmp  input
              
       break:
            printn ''
            
            mov ah,9 
            lea dx,msg1
            int 21h  
            
            mov ah,2
            mov dl,first
            cmp dl,90
            jle  pr1
            print 'NO capital !'
            
            pr1: 
               int 21h
             
            printn ''
             
            mov ah,9 
            lea dx,msg2
            int 21h  
            
            mov ah,2
            mov dl,last
            cmp dl,65
            jge  pr2
            print 'NO capital !'
            
            pr2: 
               int 21h
            
            

main endp