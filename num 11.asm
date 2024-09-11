
.MODEL SMALL
 .STACK 100H

 .DATA
   PRO_1  DB  'Enter the binary number: $'
   PRO_2  DB  0DH,0AH,'The equivalent Hexadecimal number : $'
   ILLEGAL   DB  0DH,0AH,'Illegal binary number. Type again : $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PRO_1             
     MOV AH, 9
     INT 21H

     JMP @START_2                 

     @START_1:                    
       LEA DX, ILLEGAL            
       MOV AH, 9
       INT 21H

       XOR BX, BX                 
       MOV DH, 0                  

     @START_2:                    
       MOV AH, 1                   
       INT 21H

       CMP AL, 0DH                
       JNE @SKIP                  

       CMP DH, 1                  
       JB @START_1                
       JMP @END                   

       @SKIP:                     

       INC DH                     
       AND AL, 0FH               

       CMP AL, 0                  
       JB @START_1                

       CMP AL, 1                  
       JA @START_1                

       SHL BX, 1                  
       OR BL, AL                  

       CMP DH, 16                 
       JE @END                    
       JMP @START_2               

     @END:                        

     LEA DX, PRO_2             
     MOV AH, 9
     INT 21H

     MOV CX, 4                    
     MOV AH, 2                    

     @LOOP_1:                     
       XOR DX, DX                 

       @LOOP_2:                   
         SHL BX, 1                
         RCL DL, 1                
         INC DH                   
         CMP DH, 4                
       JNE @LOOP_2                

       CMP DL, 9                  
       JBE @NUMERIC_DIGIT         
       SUB DL, 9                  
       OR DL, 40H                 
       JMP @DISPLAY               

       @NUMERIC_DIGIT:            
         OR DL, 30H               

       @DISPLAY:                  
         INT 21H                  
     LOOP @LOOP_1                 

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN