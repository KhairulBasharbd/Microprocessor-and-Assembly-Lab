
.MODEL SMALL
.STACK 100H

.DATA

    MSG1 DB 'Enter a number (from 0 to 9)',0dh,0ah,'$'
    MSG2 DB 0dh,0ah,'EVEN $' 
    MSG3 DB 0dh,0ah,'ODD $'
    DV DB 02H
    

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    XOR AX,AX
    SUB BL,30H
    MOV AL,BL  
    
    DIV DV
    CMP AH,01H
    JNE EVEN 
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H 
    JMP EXIT
    
    EVEN:
        LEA DX,MSG2
        MOV AH,9
        INT 21H
         
    EXIT:     
        MOV AH,4CH
        INT 21H
    
MAIN ENDP
    END MAIN
                         




