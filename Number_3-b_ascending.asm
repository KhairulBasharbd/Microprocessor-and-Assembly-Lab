include emu8086.inc
.MODEL SMALL

.STACK 100H

.DATA   
    
    msg db 'input : $'
    arr DB 50 DUP('$') 

.CODE

MAIN PROC
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,9
    int 21h
    
    mov si,0
    mov ah,1
input: 
    int 21h
    cmp al,0dh
    je break
    mov arr[si],al
    inc si
    jmp input    
    
break:
    mov si,0
    
loop1:
    mov di,si
    cmp arr[si],'$'
    je end_loop1
     
    loop2:
        inc di 
        cmp arr[di],'$'
        je end_loop2 
        mov ah,arr[si]
        cmp ah,arr[di]
        jg swap
        jmp loop2
    
    swap:
        mov al,ah
        mov ah,arr[di]
        mov arr[si],ah
        mov arr[di],al
        jmp loop2
    
    
    
    end_loop2:
        inc si
        jmp loop1
    
 end_loop1:
    printn ''
    lea dx,arr
    mov ah,9
    int 21h
        
END MAIN