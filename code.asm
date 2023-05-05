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
 
start:
mov ax,@data
mov ds,ax

xor ax,ax 
xor dx,dx
 
;;;;;;;;;;;;  
lea ax, aMorse
proc p
lea bx, letterOffset
add bx,0
mov [bx], ax
endp  


;;;;;;;;;;;

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

cmp al, dl
JE a
inc dl

cmp al, dl
JE b
inc dl

a: 
lea dx, aMorse
mov AH,09h
int 21h
b:
lea dx, bMorse
mov AH,09h
int 21h
c:
lea dx, cMorse
mov AH,09h
int 21h
d:
lea dx, dMorse
mov AH,09h
int 21h
e:
lea dx, eMorse
mov AH,09h
int 21h
f:     
lea dx, fMorse
mov AH,09h
int 21h
g:     
lea dx, gMorse
mov AH,09h
int 21h
h:     
lea dx, hMorse
mov AH,09h
int 21h
i:     
lea dx, iMorse
mov AH,09h
int 21h
j:     
lea dx, jMorse
mov AH,09h
int 21h
k:     
lea dx, kMorse
mov AH,09h
int 21h
l:     
lea dx, lMorse
mov AH,09h
int 21h
m:     
lea dx, mMorse
mov AH,09h
int 21h
n: 
lea dx, nMorse
mov AH,09h
int 21h
o:     
lea dx, oMorse
mov AH,09h
int 21h
p:     
lea dx, pMorse
mov AH,09h
int 21h
q:     
lea dx, qMorse
mov AH,09h
int 21h
r:     
lea dx, rMorse
mov AH,09h
int 21h
s:     
lea dx, sMorse
mov AH,09h
int 21h
t:     
lea dx, tMorse
mov AH,09h
int 21h
u:     
lea dx, uMorse
mov AH,09h
int 21h
v:     
lea dx, vMorse
mov AH,09h
int 21h
w:     
lea dx, wMorse
mov AH,09h
int 21h
x:     
lea dx, xMorse
mov AH,09h
int 21h
y:     
lea dx, yMorse
mov AH,09h
int 21h
z:     
lea dx, zMorse
mov AH,09h
int 21h

loop placeInString
exit:
END
