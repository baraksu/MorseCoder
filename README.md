# MorseCoder
Menu:
+ Enter a string  
+ Print the message.  
+ Send the message to c# and play it. 
.MODEL small
.STACK 100h

.DATA
msg1 db 'Enter a string: $' 
msg2 db 'The string expected is: $'
crlf    db 13,10,'$'
str db 100
strlen db 0
strtxt db 100 dup(0)

.CODE
start:
mov ax,@data
mov ds,ax

xor ax,ax 
xor dx,dx


lea DX,msg1 ;show msg1
mov AH,09h
int 21h 
        
     
lea dx,str
mov AH,0Ah  ;Read a string
int 21h   


lea DX,crlf ;New line
 mov AH,09h
int 21h

lea dx,msg2 ;show message 2
mov ah,09h
int 21h

xor ax,ax      ;save the string
mov al, strlen
lea bx, strtxt
add bx,ax
mov [bx],'$'

lea dx,strtxt  ;print the string
mov ah,09h
int 21h


exit:







END

