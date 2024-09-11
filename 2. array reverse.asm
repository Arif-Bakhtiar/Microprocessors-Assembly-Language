.model small
.data
    rev db '543210$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov si,offset rev
    mov di,offset rev+5
    mov cx,5

    
    loop1:  
    mov bx,[si]
    push bx
    inc si
    loop loop1
    
    mov cx,5
    
    loop2:
    pop dx
    mov ah,02h
    int 21h
    loop loop2

main endp
end main