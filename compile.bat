@echo off

REM Deleting all files in the map, step1, step2, and step3 directories.

if not exist .\map\NUL   mkdir map
if not exist .\step1\NUL mkdir step1
if not exist .\step2\NUL mkdir step2
if not exist .\step3\NUL mkdir step3

if exist .\map\*.map   del .\map\*.map   > NUL
if exist .\step1\*.dat del .\step1\*.dat > NUL
if exist .\step1\*.elf del .\step1\*.elf > NUL
if exist .\step1\*.lnk del .\step1\*.lnk > NUL
if exist .\step1\*.map del .\step1\*.map > NUL
if exist .\step2\*.dat del .\step2\*.dat > NUL
if exist .\step2\*.lnk del .\step2\*.lnk > NUL
if exist .\step3\*.dat del .\step3\*.dat > NUL
if exist .\step3\*.bat del .\step3\*.bat > NUL
if exist .\step3\*.bn1 del .\step3\*.bn1 > NUL
if exist .\step3\*.bn2 del .\step3\*.bn2 > NUL
if exist .\step3\*.crc del .\step3\*.crc > NUL
if exist *.o           del *.o           > NUL
if exist *.elf         del *.elf         > NUL
if exist *.mem         del *.mem         > NUL
if exist *.tmp         del *.tmp         > NUL

REM Compile the source code.
.\FANUCLIB\Tool\nmake.exe

IF %ERRORLEVEL% GTR 0 GOTO ERR

exit
:ERR
REM Pause the batch file in case of an error.
Pause

