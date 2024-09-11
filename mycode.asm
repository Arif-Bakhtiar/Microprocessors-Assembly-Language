.model small
.stack 100h









data segment

msg db “enter the size of array $”

msg1 db 0ah,0dh,”enter eight bit nor $”

res db 0ah,0dh,”sum of array elements is   $”

space db ”        $”

n db 00h

arr db ?

sum db 00h

data ends

 

code segment

start:

assume ds:data,cs:code

mov ax,@data

mov ds,ax

lea dx,msg

call read

mov n,dl

;

lea si,arr

mov cl,n

mov ch,00h

mov bl,00h

arrread:    lea dx,msg1

call read

mov [si],dl

add bl,dl

inc si

loop arrread

mov sum,bl

lea dx,res

mov ah,09h

int 21h

mov cl,n

mov ch,00h

lea si,arr

 

call disp

 

jmp final

 

read proc near

mov ah,09h

int 21h

mov dl,00h

mov ah,01h

int 21h

and al,0fh

shl al,04h

add dl,al

mov ah,01h

int 21h

and al,0fh

add dl,al

ret

read endp

 

disp proc near

mov dl,sum

and dl,0f0h

shr dl,04h

add dl,30h

mov ah,02h

int 21h

mov dl,sum

and dl,0fh

add dl,30h

mov ah,02h

int 21h

lea dx,space

mov ah,09h

int 21h

ret

 

disp endp

 

final:

end start

code ends