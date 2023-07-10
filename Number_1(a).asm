.MODEL SMALL
.STACK 100H

.DATA

    MSG1 DB 'Enter a single digit decimal number (From 1 to 3)',0DH,0AH,'$'

    MSG2 DB 0DH,0AH,'The series of summation is $'
    
    
    
.CODE  

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG1
    
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    
    XOR CX,CX
    
    MOV CL,AL
    
    XOR AX,AX
    
    TOP:
        ADD AX,CX
    
        LOOP TOP 
        
    MOV BX,AX
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    
    ADD BX,30H    
    MOV DL,BL
    MOV AH,2
    INT 21H
        
    
    MOV AH,4CH
    INT 21H
    
    
MAIN ENDP

    END MAIN
    
        