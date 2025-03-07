;=========================================================
; 文件名: ex1.ASM
; 功能描述: 实现可以闪烁的流水灯
;=========================================================
START: MOV DX, 0646H
       MOV AL, 80H
       OUT DX, AL
L3:  MOV BX, 0000H
     MOV CX, 0010H
AA1: MOV DX, 0640H
     MOV AL, BL
     OUT DX, AL
     MOV DX, 0642H
     MOV AL, BH
     OUT DX, AL
     ROL BX, 1
     INC BX
     CALL DELAY
     CALL DELAY
     LOOP AA1
     MOV CX, 0008H
AA3: MOV DX, 0642H
     MOV AL, BL
     OUT DX, AL
     MOV DX, 0640H
     MOV AL, BH
     OUT DX, AL
     NOT BX
     CALL DELAY
     CALL DELAY
     LOOP AA3
     JMP L3
DELAY: PUSH CX
       MOV CX, 0F000H
AA2:   PUSH AX
       POP AX
       LOOP AA2
       POP CX
       RET 
CODE   ENDS
       END START
