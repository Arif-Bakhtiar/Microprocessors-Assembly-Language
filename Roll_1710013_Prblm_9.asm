.MODEL SMALL
 .STACK 100H

 .DATA
   PRO_1  DB  0DH,0AH,'Enter the character : $'
   PRO_2  DB  0DH,0AH,'The ASCII code of the given number in HEX form is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     @START:                       
       LEA DX, PRO_1          
       MOV AH, 9
       INT 21H

       MOV AH, 1                  
       INT 21H

       MOV BL, AL                 

       CMP BL, 0DH                
       JE @END                    

       LEA DX, PRO_2           
       MOV AH, 9
       INT 21H

       XOR DX, DX                 
       MOV CX, 4                  

       @LOOP_1:                   
         SHL BL, 1                
         RCL DL, 1               
                                  
       LOOP @LOOP_1               

       MOV CX, 4                  

       @LOOP_2:                  
         SHL BL, 1                
         RCL DH, 1                
                                  
       LOOP @LOOP_2               

       MOV BX, DX                 
       MOV CX, 2                  

       @LOOP_3:                   
         CMP CX, 1                
         JE @SECOND_DIGIT         
         MOV DL, BL               
         JMP @NEXT                

         @SECOND_DIGIT:           
           MOV DL, BH             

         @NEXT:                   

         MOV AH, 2               

         CMP DL, 9                
         JBE @NUMERIC_DIGIT      
         SUB DL, 9               
         OR DL, 40H               
         JMP @DISPLAY             

         @NUMERIC_DIGIT:          
           OR DL, 30H             

         @DISPLAY:                
           INT 21H               
       LOOP @LOOP_3             

       JMP @START                 

     @END:                        

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN