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

proc checker
mov ax, 61h
loop1:
inc ax
cmp dx,ax 
je ax
cmp dx,ax
jne loop1 
a:
b:
c:
d:
e:
f:
g:
h:
i:
j:
k:
l:
m:
n:
o:
p:
q:
r:
s:
t:
u:
v:
w:
x:
y:
z:
pop ax  
pop dx
endp checker
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
mov cx, strlen
mov bx, 02fh
looper1
inc bx
push ax
push dx
call checker
loop looper1
exit:
                  
                  
                  






END
