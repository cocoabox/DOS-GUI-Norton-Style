@echo off
set TA="\TASM\BIN\TASM.EXE"
set TP="\TP\BIN\TPC.EXE"

cd obj\
%TA% -mx asm_ints.asm
%TA% -mx mousepa.asm
%TA% -mx cpu.asm
%TA% -mx bgi_256.asm
cd ..\

%TP% -Oobj -Ebin -Ulib  oop\testobj
goto :eof

%TP% -Oobj -Ebin -Ulib  oop\errordlg 
%TP% -Oobj -Ebin -Ulib  oop\varConst
%TP% -Oobj -Ebin -Ulib  oop\mouseObj
%TP% -Oobj -Ebin -Ulib  oop\generalObj
%TP% -Oobj -Ebin -Ulib  oop\savRstObj
%TP% -Oobj -Ebin -Ulib  oop\windowsO
%TP% -Oobj -Ebin -Ulib  oop\winApplObj
%TP% -Oobj -Ebin -Ulib  oop\pullDnMe
%TP% -Oobj -Ebin -Ulib  oop\topicHlp
%TP% -Oobj -Ebin -Ulib  oop\helpObj
%TP% -Oobj -Ebin -Ulib  oop\winObjA
%TP% -Oobj -Ebin -Ulib  oop\winObjB
%TP% -Oobj -Ebin -Ulib  oop\winObjC

%TP% -Oobj -Ebin -Ulib  oop\testobj
%TP% -Oobj -Ebin -Ulib  oop\demoFx
%TP% -Ifonts -Oobj -Ebin -Ulib  oop\winInit

%TP% -Oobj -Ebin -Ulib  oop\testobj
%TP% -Oobj -Ebin -Ulib  oop\test

:eof

