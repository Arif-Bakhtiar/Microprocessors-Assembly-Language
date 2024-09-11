
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

 .MODEL SMALL
 .STACK 100H

 .DATA
   PRO_1  DB  'Enter the character : $ '
   PRO_2  DB  0DH,0AH,'The ASCII code of the given number in binary form is : $'
   PRO_3  DB  0DH,0AH,'The number of 1 bits in ASCII code are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PRO_1               
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     XOR BX, BX                   
     MOV BL, AL                   

     LEA DX, PRO_2            
     MOV AH, 9
     INT 21H

     XOR BH, BH                   
     MOV CX, 8                    
     MOV AH, 2                    
     
     @OUTPUT:                     
       SHL BL, 1                  

       JNC @ZERO                  
       INC BH                     
       MOV DL, 31H                
       JMP @DISPLAY               
       
       @ZERO:                     
         MOV DL, 30H              

       @DISPLAY:                  
         INT 21H                  
     LOOP @OUTPUT                 

     LEA DX, PRO_3             
     MOV AH, 9
     INT 21H

     OR BH, 30H                   

     MOV AH, 2                    
     MOV DL, BH
     INT 21H

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN