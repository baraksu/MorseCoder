; version 100 
.MODEL small
.STACK 100h

.DATA
array db 0FFh dup(0)
msg0 db  ''
db ' _   _  ____   ____    ___   ___     ___  ____   ___   ___   ____  ',13,10
db ') \_/ (/ __ \ /  _ \  (  _( ) __(   / _( / __ \ \   \ ) __( /  _ \ ',13,10
db '|  _  |))__(( )  ' /  _) \  | _)    ))_  ))__(( | ) ( | _)  )  ' /'  ,13,10
db ')_( )_(\____/ |_()_\ )____) )___(   \__( \____/ /___/ )___( |_()_\$'                                                                 
                                                                    
                                                                  

msg1 db 13,10, 'Enter a string: $' 
msg2 db 'The string expected is: $'
msg3 db 13,10,'Hit any key to exit $'
msg4 db 13,10, 'The string in code morse: $'
msg5 db 13,10, 'No string was entered. $'
crlf db 13,10,'$'

aMorse db '.-  $' ;translating the characters for their morse ttanslations
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
fourMorse db ' ....- $'
fiveMorse db '..... $'
sixMorse db '-.... $'
sevenMorse db '--... $'
eightMorse db '---.. $'
nineMorse db '----. $'

spaceMorse db '/ $' ;< >
exclamationmark db '-.-.-- $';<!>
quotationMarkMorse db '.-..-. $' ; Quotation Mark (")
noneTranslate db ' # $' ; Number Sign (#)
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


letterOffset db 100 dup(0) ;creating an array of the offsets of the vars.
str db 100 ; the max length of the string
strlen db 0 ;the actual length of the string
strtxt db 100 dup(0) ; an array that stores the string.


.CODE
proc segmant ;changing the segment of the data to 0730h 
push dx
mov dx,0750h
mov DS,dx         
pop dx
ret 
endp segmant 
proc segmant2 ;changing the segment of the data to 0730h 
push dx
mov dx,0740h
mov DS,dx         
pop dx
ret 
endp segmant2

proc unsegmant ;returning the segment of the data to 0720h. 
push dx
mov dx,0720h
mov DS,dx         
pop dx
ret 
endp unsegmant

proc p      ;get ax which stors an offset of a var and puts it in the array letterOffset.
lea bx, letterOffset
add bx, cx
inc cx
mov [bx], ax
ret  
endp p

proc punctuationmarks1 ;printing the punctuation mark using is offset which is stored in the array letterOffset
push ax
push bx                           
push dx 
sub al, 32
add bl, al
mov bl, [letterOffset+bx]                
mov dl, bl
mov ah, 09h


call segmant ;changing the data segment to 0730h because the punctuation marks are stored there.
int 21h

call unsegmant ;returning the data segment back to is normal state
pop dx
pop bx
pop ax                                                
ret 6 
endp punctuationmarks1

proc punctuationmarks2 ;printing the letter ax morse translation using is offset which is stored in the array letterOffset
push ax
push bx                           
push dx 
sub al, 58
add bl, al
mov bl, [letterOffset+bx]                
mov dl, bl
mov ah, 09h

call segmant ;changing the data segment to 0730h because the punctuation marks are stored there.
int 21h

call unsegmant ;returning the data segment back to is normal state
pop dx
pop bx
pop ax                                                                                                
ret 6 
endp punctuationmarks2

proc capital  ;Getting ax who stors a capital letter and changing it to store the same letter but in low case.
add ax,20h
jmp printLetter
endp capital

proc number ;Getting ax, who stors a number and using the array letterOffset to print the letter in her morse form.
push ax
push bx               
push dx
xor dx,dx
add bl,al
sub bl,48
mov bl,[letterOffset+bx]
mov dl,bl
mov ah,09h 
call segmant ; check if it needed to change the segment and if it needed calls a procdure to change it.
int 21h 

call unsegmant ;returns the segment back to normal.

pop dx
pop bx
pop ax
ret 6
endp number

proc printLetter ;take the letter from ax and  print the letter ascii form using is location that is stored in the letterOffset array.
push ax
push bx
push dx 
                      
sub al,61h
add bl,al
mov bl,[letterOffset+bx]
mov dx,bx
mov ah,09h
call segmant2
cmp al,17h
jb no
call segmant
no: 
int 21h 
call unsegmant
pop dx
pop bx
pop ax                                               
ret 6
endp printLetter    

start:
mov ax,@data
mov ds,ax

lea DX,msg0 ;show msg0
mov AH,09h
int 21h 

lea DX,msg1 ;show msg1
mov AH,09h
int 21h 
        
     
lea dx,str
mov AH,0Ah  ;Read a string
int 21h   


lea DX,crlf ;New line
 mov AH,09h
int 21h

cmp strlen,0 
je noString

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

lea DX,crlf ;New line
 mov AH,09h
int 21h

xor ax,ax 
xor dx,dx
xor cx,cx

lea ax, aMorse ; put the location of aMorse in ax
call p

lea ax, bMorse ; put the location of bMorse in ax
call p

lea ax, cMorse ; put the location of cMorse in ax
call p

lea ax, dMorse ; put the location of dMorse in ax
call p

lea ax, eMorse ; put the location of eMorse in ax
call p

lea ax, fMorse ; put the location of fMorse in ax
call p

lea ax, gMorse ; put the location of gMorse in ax
call p

lea ax, hMorse ; put the location of hMorse in ax
call p

lea ax, iMorse ; put the location of iMorse in ax
call p

lea ax, jMorse ; put the location of jMorse in ax
call p

lea ax, kMorse ; put the location of kMorse in ax
call p

lea ax, lMorse ; put the location of lMorse in ax
call p

lea ax, mMorse ; put the location of mMorse in ax
call p

lea ax, nMorse ; put the location of nMorse in ax
call p

lea ax, oMorse ; put the location of oMorse in ax
call p

lea ax, pMorse ; put the location of pMorse in ax
call p

lea ax, qMorse ; put the location of qMorse in ax
call p

lea ax, rMorse ; put the location of rMorse in ax
call p

lea ax, sMorse ; put the location of sMorse in ax
call p

lea ax, tMorse ; put the location of tMorse in ax
call p

lea ax, uMorse ; put the location of uMorse in ax
call p

lea ax, vMorse ; put the location of vMorse in ax
call p

lea ax, wMorse ; put the location of wMorse in ax
call p

lea ax, xMorse ; put the location of xMorse in ax
call p

lea ax, yMorse ; put the location of yMorse in ax
call p

lea ax, zMorse ; put the location of zMorse in ax
call p

lea ax, zeroMorse ; put the location of zeroMorse in ax
call p

lea ax, oneMorse ; put the location of oneMorse in ax
call p

lea ax, twoMorse ; put the location of twoMorse in ax
call p

lea ax, threeMorse ; put the location of threeMorse in ax
call p

lea ax, fourMorse ; put the location of fourMorse in ax
call p

lea ax, fiveMorse ; put the location of fiveMorse in ax
call p

lea ax, sixMorse ; put the location of sixMorse in ax
call p

lea ax, sevenMorse ; put the location of sevenMorse in ax
call p

lea ax, eightMorse ; put the location of eightMorse in ax
call p

lea ax, nineMorse ; put the location of nineMorse in ax
call p

lea ax, spaceMorse ; put the location of spaceMorse in ax
call p

lea ax, exclamationmark ; put the location of exclamationmark in ax
call p

lea ax, quotationMarkMorse ; put the location of quotationMarkMorse in ax
call p

lea ax, noneTranslate ; put the location of noneTranslate in ax
call p

lea ax, dollarSignMorse ; put the location of dollarSignMorse in ax
call p

lea ax, percentSignMorse ; put the location of percentSignMorse in ax
call p

lea ax, ampersandMorse ; put the location of ampersandMorse in ax
call p

lea ax, singleQuoteMorse ; put the location of singleQuoteMorse in ax
call p

lea ax, ParenthesisLeft ; put the location of ParenthesisLeft in ax
call p

lea ax, ParenthesisRight ; put the location of ParenthesisRight in ax
call p

lea ax, asteriskMorse ; put the location of asteriskMorse in ax
call p

lea ax, plusSignMorse ; put the location of plusSignMorse in ax
call p

lea ax, commaMorse ; put the location of commaMorse in ax
call p

lea ax, hyphenMorse ; put the location of hyphenMorse in ax
call p

lea ax, periodMorse ; put the location of periodMorse in ax
call p

lea ax, forwardSlashMorse ; put the location of forwardSlashMorse in ax
call p

lea ax, colonMorse ; put the location of colonMorse in ax
call p

lea ax, noneTranslate ; put the location of noneTranslate in ax
call p

lea ax, noneTranslate ; put the location of noneTranslate in ax
call p

lea ax, equalMorse ; put the location of equalMorse in ax
call p

lea ax, noneTranslate ; put the location of noneTranslate in ax
call p

lea ax, questionMarkMorse ; put the location of questionMarkMorse in ax
call p

lea ax, strudelMorse ; put the location of strudelMorse in ax
call p

xor ax,ax
lea dx, msg4 ;show msg4 on screen.
mov ah, 09h
int 21h
xor cx,cx   
xor ax,ax 
xor bx,bx
xor dx,dx

mov cl ,strlen ;put the length of the string in cl


placeInString:  ; lop that goes throw every letter of the string by order.
xor bx,bx



mov al, [strtxt + SI]  ; mov a char from the array strtxt from the SI place in the array to al 
inc SI 

cmp al,61h    ;check if the char is a letter if not jump to not letter
jb notletter

cmp al,07Ah
ja notletter 

call printLetter  
jmp afterPrint   ; after the procdure is done jump to the start of the translate of the next char 

notletter:
cmp al,41h        ;check if the char is a capital letter if not jump to notcapital
jb notcapital

cmp al,05Ah 
ja notcapital

call capital
jmp afterPrint  ; after the procdure is done jump to the start of the translate of the next char.

notcapital:
add bl,26   

cmp al,30h  ;check if the char is a number if not jump to not number
jb notnumber

cmp al,39h
ja notnumber

call number
jmp afterPrint   ; after the procdure is done jump to the start of the translate of the next char 

notnumber:
add bl,10  

cmp al,20h ; check if the char is a part of punctuationmarks1 if not jump to notsign1
jb notSign1

cmp al,02Fh
ja notSign1

call punctuationmarks1
jmp afterPrint  ; after the procdure is done jump to the start of the translate of the next char.

notSign1:
add bl, 16

cmp al,03Ah ; check if the char is a part of punctuationmarks2 if not jump to notsign2
jb cantBeTranslated

cmp al,40h
ja cantBeTranslated

call punctuationmarks2
jmp afterPrint  ; after the procdure is done jump to the start of the translate of the next char 


cantBeTranslated: 

lea dx, noneTranslate ;show noneTranslate on screen.
mov ah,09h  
int 21h

afterPrint:

loop placeInString
jmp afterLoop
noString:
lea DX,msg5 ;Show msg5 on screen
mov AH,09h
int 21h 
afterLoop: 

lea DX,msg3 ;Show msg3 on screen
mov AH,09h
int 21h
        
mov AH,01h  ;Read a character
int 21h  

exit:   
mov AH,4Ch  ;End program
int 21h

END start
