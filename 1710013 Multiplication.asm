
TITLE INPUT OUTPUT CODE
.MODEL SMALL
.STACK 100H
.DATA
A DB "ENTER ANY FOUR NUMBERS: $"
.CODE

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A         
    INT 21H
    
    MOV AH,1
    INT 21H                ;1st Input
    MOV BL,AL
                              
    MOV AH,1               ;2nd Input
    INT 21H
    MOV BH,AL
    
    MOV AH,1
    INT 21H                ;3rd Input
    MOV CL,AL 
    
    MOV AH,1
    INT 21H                ;4th Input
    MOV CH,AL
    
    MOV AH,2
    MOV DL,10  
    INT 21H                ;New Line
    MOV DL,13
    INT 21H      
    
    MOV AH,2
    MOV DL,BL              ;1st Output
    INT 21H
    
    MOV AH,2
    MOV DL,10  
    INT 21H                ;New Line
    MOV DL,13
    INT 21H       
    
    MOV AH,2
    MOV DL,BH              ;2nd Output
    INT 21H
    
    MOV AH,2
    MOV DL,10              ;New Line
    INT 21H     
    MOV DL,13
    INT 21H
    
    MOV AH,2
    MOV DL,CL              ;3rd Output
    INT 21H                   
    
    MOV AH,2
    MOV DL,10  
    INT 21H                ;New Line
    MOV DL,13
    INT 21H  
    
    MOV AH,2
    MOV DL,CH              ;4th Output
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H                   
    MAIN ENDP
END MAIN
    