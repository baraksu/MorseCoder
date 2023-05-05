.MODEL small
.STACK 100h

.DATA
msg1 db 'Enter a string: $' 
msg2 db 'The string expected is: $'
crlf db 13,10,'$'
aMorse db '.-  $'
bMorse db '-... $'
cMorse db '-.-.: $'
dMorse db '-.. $'
eMorse db ' $'
fMorse db ' $'
gMorse db ' $'
hMorse db ' $'
iMorse db ' $'
jMorse db ' $'
kMorse db ' $'
lMorse db ' $'
mMorse db ' $'
nMorse db ' $'
oMorse db ' $'
pMorse db ' $'
qMorse db ' $'
rMorse db ' $'
sMorse db ' $'
tMorse db ' $'
uMorse db ' $'
vMorse db ' $'
wMorse db ' $'
xMorse db ' $'
yMorse db ' $' 
zMorse db ' $' 
letterOffset db 32 dup(0)


str db 100
strlen db 0
strtxt db 100 dup(0)


.CODE
proc p
push ax
lea bx, letterOffset
mov [bx], ax
pop ax
pop bx
ret
endp p 
 
start:
mov ax,@data
mov ds,ax

xor ax,ax 
xor dx,dx

letter: 
lea ax, aMorse ; needs to find how to reach into each letter morse.
push ax 
push bx
call p 
inc bx
loop letter
 
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
mov cl, strlen
mov bx, 02fh

lea DX,crlf ;New line
 mov AH,09h
int 21h

xor cx,cx   
xor ax,ax 
xor bx,bx
xor dx,dx
mov cl ,strlen

placeInString:
mov dl, 61h
mov al, [strtxt + bx]
inc bx

loop placeInString
exit:
END
