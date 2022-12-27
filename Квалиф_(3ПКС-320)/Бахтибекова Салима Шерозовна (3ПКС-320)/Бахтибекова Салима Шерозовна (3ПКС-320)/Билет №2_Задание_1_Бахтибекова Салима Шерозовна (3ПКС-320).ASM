format PE console
include 'win32a.inc'
start:
;;макрос для вывода на экран зарплат
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


cinvoke printf, text2
;;массив зарплат, вводимый в теле программы
lea ebx,[A]
mov [ebx], dword 48874
mov [ebx+4],dword 58527
mov [ebx+8],dword 49138
mov [ebx+12],dword 52062
mov [ebx+16],dword 57151
mov [ebx+20],dword 59026
mov [ebx+24],dword 46333
mov [ebx+28],dword 43649
mov [ebx+32],dword 46633
;;вывод на экран зарплат костикова
prntn A,[N]

;;вызов процедуры для нахождения средней зарплаты костикова
lea eax,[A]
push eax
mov eax,[N]
push eax
call average
mov ebx,eax

cinvoke printf, text3,eax
cinvoke printf, text
cinvoke printf, text5
;;массив зарплат, вводимый в теле программы
lea ebx,[B]
mov [ebx], dword 49031
mov [ebx+4],dword 46370
mov [ebx+8],dword 52841
mov [ebx+12],dword 43236
mov [ebx+16],dword 57473
mov [ebx+20],dword 46342
mov [ebx+24],dword 56241
mov [ebx+28],dword 58512
mov [ebx+32],dword 51779
mov [ebx+36],dword 43422
;;вывод на экран зарплат снежной
prntn B,[NN]
;;вызов процедуры для нахождения средней зарплаты снежной
lea eax,[B]
push eax
mov eax,[NN]
push eax
call average
mov ebx,eax

cinvoke printf, text3,eax
;;массив зарплат, вводимый в теле программы
cinvoke printf, text
cinvoke printf, text6
lea ebx,[C]
mov [ebx], dword 48968
mov [ebx+4],dword 50559
mov [ebx+8],dword 50900
mov [ebx+12],dword 48150
mov [ebx+16],dword 45444
mov [ebx+20],dword 46944
;;вывод на экран зарплат дилеевой
prntn C,[NNN]
;;вызов процедуры для нахождения средней зарплаты дилеевой
lea eax,[C]
push eax
mov eax,[NNN]
push eax
call average
mov ebx,eax

cinvoke printf, text3,eax



invoke sleep,1000000
invoke exit,0

;;процедура для 1)рассчёта сумм зарплат и 2)рассчёта средней зарплаты
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

;;выделение места для массивов зарплат
A dd 9 dup(?)
N dd 9
B dd 10 dup(?)
NN dd 10
C dd 6 dup(?)
NNN dd 6

text db 10, 13, '', 10, 13, 0
text2 db 10,13,'Kostikov ',0
text5 db 10,13,'Snejnaya ',0
text6 db 10,13,'Dileeva ',0
text3 db 10,13,'Average : %d ',0
text4 db 10,13,'kachestvo znani: %d ',0

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