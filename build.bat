@echo off
set TA="\TASM\BIN\TASM.EXE"
set TP="\TP\BIN\TPC.EXE"

if not exist %TA% goto :no_tasm
if not exist %TP% goto :no_tp

cd obj\
%TA% -mx asm_ints.asm
%TA% -mx mousepa.asm
%TA% -mx cpu.asm
%TA% -mx bgi_256.asm
cd ..\

set COMPILE_ARG=-Oobj -Ebin -Ulib

%TP% %COMPILE_ARG%  oop\winApplObj
%TP% %COMPILE_ARG%  oop\errordlg
%TP% %COMPILE_ARG%  oop\varConst
%TP% %COMPILE_ARG%  oop\mouseObj
%TP% %COMPILE_ARG%  oop\generalObj
%TP% %COMPILE_ARG%  oop\savRstObj
%TP% %COMPILE_ARG%  oop\windowsO
%TP% %COMPILE_ARG%  oop\winApplObj
%TP% %COMPILE_ARG%  oop\pullDnMe
%TP% %COMPILE_ARG%  oop\topicHlp
%TP% %COMPILE_ARG%  oop\helpObj
%TP% %COMPILE_ARG%  oop\winObjA
%TP% %COMPILE_ARG%  oop\winObjB
%TP% %COMPILE_ARG%  oop\winObjC
%TP% %COMPILE_ARG%  oop\demoFx
%TP% %COMPILE_ARG%  -Ifonts  oop\winInit

:app
del bin\main.exe
%TP% %COMPILE_ARG%   -L oop\main

:run
bin\testobj.exe
goto :eof


:no_tasm
echo "need tasm %TA% ; if tasm is installed elsewhere please change build.bat"
goto :eof

:no_tasm
echo "need turbo pascal %TP% ; if turbo pascal is installed elsewhere please change build.bat"
goto :eof

:eof
