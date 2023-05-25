; version 100 
.MODEL small
.STACK 100h

.DATA
msg1 db 'Enter a string: $' 
msg2 db 13,10, 'The string expected is: $'
msg3 db '# $'
msg4 db 13,10,'Hit any key to exit',13,10,'$'
crlf db 13,10,'$'

aMorse db '.-  $'
bMorse db '-... $'
cMorse db '-.-. $'
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

zeroMorse db '----- $'
oneMorse db '.---- $'
twoMorse db '..--- $'
threeMorse db '...-- $'
fourMorse db '....- $'
fiveMorse db '..... $'
sixMorse db '-.... $'
sevenMorse db '--... $'
eightMorse db '---.. $'
nineMorse db '----. $'

spaceMorse db '/$' ;< >
exclamationmark db '-.-.-- $';<!>
quotationMarkMorse db '.-..-. $' ; Quotation Mark (")
;numberSignMorse db ' $' ; Number Sign (#)
dollarSignMorse db '...-..- $' ; Dollar Sign ($)
percentSignMorse db '-.-..-. $' ; Percent Sign (%)
ampersandMorse db '.-... $' ; Ampersand (&)
singleQuoteMorse db '.----. $' ; Single Quote (')
ParenthesisLeft db '-.--. $' ;(
ParenthesisRight db '-.--.- $';)
asteriskMorse db '-..-.- $' ; Asterisk (*)          
plusSignMorse db '.-.-. $' ; Plus Sign (+)
commaMorse db '--..-- $' ; Comma (,)
hyphenMorse db '-....- $' ; Hyphen (-)
periodMorse db '.-.-.- $' ; Period (.)
forwardSlashMorse db '-..-. $' ; Forward Slash (/)

colonMorse db '---... $' ; <:>
equalMorse db '-...- $' ; <=>
questionMarkMorse db '..--.. $' ;<?>
strudelMorse db '.--.-. $' ;<@>


letterOffset db 100 dup(0)
str db 100
strlen db 0
strtxt db 100 dup(0)


.CODE
proc p      
lea bx, letterOffset
add bx, cx
inc cx
mov [bx], ax
ret  
endp p

proc punctuationmarks1
push ax
push bx                           ;fix the problem
push dx 
sub al, 32
add al, 36
mov bl, al
mov bh, 0
mov bl, [letterOffset+bx]                
mov dl, bl
mov ah, 09h
int 21h
pop dx
pop bx
pop ax                                                
ret 6 
endp punctuationmarks1

proc punctuationmarks2
push ax
push bx                           ;fix the problem
push dx 
sub al, 58
add al, 48 
mov bl, al
mov bh, 0
mov bl, [letterOffset+bx] 
mov dl, bl
mov ah, 09h
int 21h
pop bx
pop ax
pop dx                                                
ret 6 
endp punctuationmarks2

proc capital  
add ax,20h
jmp printLetter
endp capital

proc number
push ax
push bx
push dx
sub ax,22
mov bl,al
mov bl,[letterOffset+bx]
mov dl,bl
mov ah,09h
int 21h
pop dx
pop bx
pop ax
ret 6 
endp number

proc printLetter
push ax
push bx
push dx                        
sub al,61h
mov bl,al
mov bl,[letterOffset+bx]
mov dx,bx
mov ah,09h
int 21h 
pop dx
pop bx
pop ax
ret 6
endp printLetter    

start:
mov ax,@data
mov ds,ax

 
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

xor ax,ax 
xor dx,dx
xor cx,cx

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

lea ax, zeroMorse
call p

lea ax, oneMorse
call p

lea ax, twoMorse
call p

lea ax, threeMorse
call p

lea ax, fourMorse
call p

lea ax, fiveMorse
call p

lea ax, sixMorse
call p

lea ax, sevenMorse
call p

lea ax, eightMorse
call p

lea ax, nineMorse
call p

lea ax, spaceMorse
call p

lea ax, exclamationmark
call p

lea ax, quotationMarkMorse  
call p

lea ax, msg3
call p

lea ax, dollarSignMorse
call p

lea ax, percentSignMorse
call p

lea ax, ampersandMorse
call p

lea ax, singleQuoteMorse
call p 

lea ax, ParenthesisLeft
call p 

lea ax, ParenthesisRight
call p

lea ax, asteriskMorse
call p

lea ax, plusSignMorse
call p

lea ax, commaMorse
call p

lea ax, hyphenMorse
call p

lea ax, periodMorse
call p

lea ax, forwardSlashMorse
call p  

lea ax, colonMorse
call p 

lea ax, msg3
call p

lea ax, msg3
call p

lea ax, equalMorse
call p 

lea ax, msg3
call p

lea ax, questionMarkMorse
call p 

lea ax, strudelMorse
call p 

xor cx,cx   
xor ax,ax 
xor bx,bx
xor dx,dx

mov cl ,strlen

placeInString:
mov al, [strtxt + SI]
inc SI

cmp al,61h
jb notletter

cmp al,07Ah
ja notletter 

call printLetter
jmp afterPrint

notletter:
cmp al,41h
jb notcapital

cmp al,05Ah
ja notcapital

call capital
jmp afterPrint

notcapital:
cmp al,30h
jb notnumber

cmp al,39h
ja notnumber

call number
jmp afterPrint  

notnumber:
cmp al,20h
jb notSign1

cmp al,02Fh
ja notSign1

call punctuationmarks1
jmp afterPrint

notSign1:

cmp al,03Ah
jb cantBeTranslated

cmp al,40h
ja cantBeTranslated

call punctuationmarks2
jmp afterPrint

cantBeTranslated: 

lea dx, msg3
mov ah,09h
int 21h

afterPrint:

loop placeInString

lea DX,msg4 ;Show msg3 on screen
mov AH,09h
int 21h
        
mov AH,01h  ;Read a character
int 21h  

exit:   mov AH,4Ch  ;End program
        int 21h

END start
