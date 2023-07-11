.MODEL SMALL
.STACK 100H
.DATA
    PRIME_NUMBERS DB 2D,3D,5D,7D,'$'
    INPUT_MSG DB 'ENTER YOUR NUMBER: $'
    PRIME_MSG DB 0DH,0AH,'PRIME NUMBER$'
    NOT_PRIME_MSG DB 0DH,0AH,'NOT PRIME NUMBER$'
    NUM DB 0D
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    ;SHOW INPUT PROMPT
    MOV AH,9D
    LEA DX,INPUT_MSG
    INT 21H

    ; TAKE INPUT
    MOV AH,1
    INT 21H
    MOV NUM,AL
    SUB NUM,48

    MOV CX,4
    MOV BL,2

    CHECK_PRIME:
        CMP NUM,0D ; Exceptional case for zero
        JE NON_PRIME

        CMP NUM,1D ;; Exceptional case for one
        JE NON_PRIME
        ;CHECK IF SI IS LESS THAN THE NUMBER
        CMP BL,NUM
        JGE PRIME

        XOR AX,AX ; need to clear AX because prev div operation change the value of AH, but we assume here AH is zero
        MOV AL,NUM
        DIV BL
        CMP AH,0D
        JE NON_PRIME
        
        ;PRINT BL
        ; MOV DL,BL
        ; ADD DL,48D
        ; MOV AH,2
        ; INT 21H

        INC BL
    JMP CHECK_PRIME

    NON_PRIME:
        LEA DX,NOT_PRIME_MSG
        MOV AH,9D
        INT 21H
        JMP EXIT
    PRIME:
        LEA DX,PRIME_MSG
        MOV AH,9D
        INT 21H

    EXIT:

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN