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

startOffset db  
letterOffset db 100 dup(0)
str db 100
strlen db 0
strtxt db 100 dup(0)


.CODE

start: 

lea dx,spaceMorse
mov startOffset,dx

lea bx, letterOffset ;start
mov [bx],0 

lea ax,exclamationmark
sub ax, startOffset
mov [bx+ 1], ax
  
mov ax, [bx+ 1]
add ax, startOffset

;ax contains the start of exclamationmark



lea ax,quotationMarkMorse
sub ax, startOffset
mov [bx+ 2], ax 



 

lea DX,msg4 ;Show msg3 on screen
mov AH,09h
int 21h
        
mov AH,01h  ;Read a character
int 21h  

exit:   mov AH,4Ch  ;End program
        int 21h

END start
