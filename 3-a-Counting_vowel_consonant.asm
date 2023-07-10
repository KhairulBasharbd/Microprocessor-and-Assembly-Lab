include emu8086.inc
.MODEL SMALL
.STACK 100H  

.DATA

    VOWEL DB 'AaEeIiOoUu$' 
 
    msg1 db "input : $"
    msg2 db "VOWEL : $"  
    msg3 db "CONSONANT : $" 
    msg4 db "SPACE : $"                       
    msg5 db "DIGIT : $"
    
    v_c db 48
    c_c db 48
    s_c db 48
    d_c db 48
    
.CODE
    MAIN PROC    
    
        MOV AX,@DATA
        MOV DS,AX
        
        lea dx,msg1
        mov ah,9
        int 21h 
         
     input1:    
         mov ah,1
         int 21h
         cmp al,0dh
         je break 
         cmp al,' '
         je count_space
         cmp al,57
         jle check_digit 
         
         mov cx,10
         mov si,0
      check_vowel:
           cmp al,vowel[si]
           je vowel_count
           inc si
           loop check_vowel
         
           add c_c,1
           jmp input  

         
        vowel_count:
            add v_c,1
            jmp input1
    
    
    
        count_space:
            add s_c,1
            jmp input
    
        check_digit:
            cmp al,48
            jl input
            add d_c,1
            jmp input
        
        
        input:
            jmp input1
    
    
    
    
    
       
      break:
            printn '' 
            lea dx,msg2
            mov ah,9
            int 21h 
            mov ah,2 
            mov dl,v_c
            ;sub dl,48
            int 21h
             
            printn '' 
            lea dx,msg3
            mov ah,9
            int 21h 
            mov ah,2 
            mov dl,c_c
            ;sub dl,48
            int 21h 
             
            printn '' 
             lea dx,msg4
            mov ah,9
            int 21h 
            mov ah,2 
            mov dl,s_c
            ;sub dl,48
            int 21h
            
            printn '' 
             lea dx,msg5
            mov ah,9
            int 21h 
            mov ah,2 
            mov dl,d_c
            ;sub dl,48
            int 21h
    
    
    
    
   MAIN ENDP