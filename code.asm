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
eMorse db '. $'
fMorse db '..-. $'
gMorse db '--. $'
hMorse db '.... $'
iMorse db '.. $'
jMorse db '.--- $'
kMorse db '-.- $'
lMorse db '.-.. $'
mMorse db '-- $'
nMorse db '-. $'
oMorse db '--- $'
pMorse db '.--. $'
qMorse db '--.- $'
rMorse db '.-. $'
sMorse db '... $'
tMorse db '- $'
uMorse db '..- $'
vMorse db '...- $'
wMorse db '.-- $'
xMorse db '-..- $'
yMorse db '-.-- $' 
zMorse db '--.. $' 
letterOffset db 32 dup(0)


str db 100
strlen db 0
strtxt db 100 dup(0)


.CODE
proc p
push ax
push bx
lea bx, letterOffset
mov [bx], ax
ret 2
endp p 
 
start:
mov ax,@data
mov ds,ax
xor ax,ax 
xor dx,dx

lea ax, aMorse
call p 
lea ax, bMorse
call p 
lea ax, cMorse
call p 
lea ax, dMorse
call p 
lea ax, eMorse
call p 
lea ax, fMorse
call p 
lea ax, gMorse
call p 
lea ax, hMorse
call p 
lea ax, iMorse
call p 
lea ax, jMorse
call p 
lea ax, kMorse
call p 
lea ax, lMorse
call p 
lea ax, mMorse
call p 
lea ax, nMorse
call p 
lea ax, oMorse
call p 
lea ax, pMorse
call p 
lea ax, qMorse
call p 
lea ax, rMorse
call p 
lea ax, sMorse
call p 
lea ax, tMorse
call p 
lea ax, uMorse
call p 
lea ax, vMorse
call p 
lea ax, wMorse
call p 
lea ax, xMorse
call p
lea ax, yMorse
call p 
lea ax, zMorse
call p  

 
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
