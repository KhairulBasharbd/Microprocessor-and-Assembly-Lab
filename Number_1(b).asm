.MODEL SMALL
.STACK 100H

.DATA

    MSG1 DB 'Enter a number (from 1 to 3)',0dh,0ah,'$'
    MSG2 DB 0dh,0ah,'The factorial is $'
    FACTORIAL DB ?
    

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    XOR CX,CX
    MOV CL,AL
    SUB CL,30H
    
    MOV AX,01H
    
    TOP:
        MUL CX
        LOOP TOP
    
    ADD AL,30H
    MOV FACTORIAL,AL
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV DL,FACTORIAL 
    MOV AH,2 
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    
MAIN ENDP
    END MAIN
                         
