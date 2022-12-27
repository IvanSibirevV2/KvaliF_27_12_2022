format PE console
include 'win32a.inc' 
start: 
macro prntn op1,op2 
{ 
 local metka 
 mov esi,op1 
 mov ecx,op2 
 mov eax,0 
metka: 
 mov eax,[esi] 
 push ecx 
 cinvoke printf,fmat,eax 
 pop ecx 
 add esi,4 
 loop metka 
} 
 
lea ebx,[A] 
mov [ebx], dword 10958
mov [ebx+4],dword 20725
mov [ebx+8],dword 38516
mov [ebx+12],dword 27747
 
cinvoke printf, text6 
prntn A,[N] 
 
 
 
lea eax,[A] 
push eax 
mov eax,[N] 
push eax 
call average 
mov ebx,eax 
 
cinvoke printf, text3,eax 
 
 
cinvoke printf, text 
 
lea eax,[A] 
push eax 
mov eax,[N] 
push eax 
push ebx 
call save 
 
 
 
 
 
 
 
 
 
 
 
 
lea ebx,[B] 
mov [ebx], dword 14212
mov [ebx+4],dword 36703
mov [ebx+8],dword 9235
                        
                       

cinvoke printf, text7 
 
prntn B,[Nn] 
 
 
 
lea eax,[B] 
push eax 
mov eax,[Nn] 
push eax 
call average 
mov ebx,eax 
 
cinvoke printf, text3,eax 
  cinvoke printf, text 
lea eax,[B] 
push eax 
mov eax,[Nn] 
push eax 
push ebx 
call save 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
lea ebx,[C] 
mov [ebx], dword 34455
 mov [ebx+4],dword 12132
 mov [ebx+8],dword 4408
;mov [ebx+12],dword 4
 cinvoke printf, text8 
 
prntn C,[NNN] 
 
 
 
lea eax,[C] 
push eax 
mov eax,[NNN] 
push eax 
call average 
mov ebx,eax 
 
cinvoke printf, text3,eax 
 
lea eax,[C] 
push eax 
mov eax,[NNN] 
push eax 
push ebx 
call save 
 
 
 
 
 ;mov eax,20
; mov ebx,100
;imul ebx
;mov ebx,30
;div ebx
;cinvoke printf, text5,eax
 
 
 
 
 
 
 
 
 
invoke sleep,1000000 
invoke exit,0 
 
 
proc average 
push ebp 
mov ebp, esp 
push ebx 
push ecx 
mov ecx, [ebp+8] 
mov ebx, [ebp+12] 
xor eax,eax 
xor edi,edi 
jcxz m4 
 
cycln: 
cmp [ebx],esi 
jg m5 
inc edi 
add eax,[ebx] 
m5: 
add ebx,4 
loop cycln 
cdq 
idiv edi 
m4: 
pop ecx 
pop ebx 
pop ebp 
ret 8 
endp 
 
proc save 
push ebp 
mov ebp, esp 
push ebx 
push ecx 
mov edx, [ebp+8] 
mov ecx, [ebp+12] 
mov ebx, [ebp+16] 
jcxz m1 
sev: 
cmp [ebx], dword 0 
jge m2 
mov eax, edx 
mov [ebx], eax 
m2: 
add ebx, 4 
loop sev 
m1: 
pop ecx 
pop ebx 
pop ebp 
ret 12 
endp 
 
A dd 4 dup(?)
N dd 4
B dd 3 dup(?)
Nn dd 3
 
C dd 3 dup(?)
NNN dd 3
 
 
text db 10, 13, '', 10, 13, 0 
text6 db 10,13,'routes Petrov: ',0
text7 db 10,13,'routes Ivanov: ',0
text8 db 10,13,'routes Sidorov: ',0
text3 db 10,13,'sredniy marshrut: %d ',0
text4 db 10,13,'sredniy marshrut: %d ',0
text5 db 10,13,' %d ',0 
fmat db '%d',9,0 
spp db '%d',0 
; import data in the same section 
data import  
library msvcrt,'MSVCRT.DLL',\ 
kernel32,'KERNEL32.DLL'  
import kernel32,\ 
sleep,'Sleep'  
import msvcrt,\ 
printf,'printf',\ 
scanf,'scanf',\ 
exit,'exit',\ 
setlocale,'setlocale',\ 
system,'system'  
end data
