#[]

set BIN_PATH=.\step3
set E2B=..\%TOOLPATH%\elf2bin
set BMG=..\%TOOLPATH%\binmerge
set MLT=.\%TOOLPATH%\SET_MULT
set CRC=.\%TOOLPATH%\CRC_CEXE
set WR_HEAD=.\%TOOLPATH%\wr_head
set PRT=.\%TOOLPATH%\cex_prot

@rem pushd %BIN_PATH%
cd %BIN_PATH%

if exist *.bn1 del *.bn1 > NUL
if exist *.bn2 del *.bn2 > NUL

if not "%F_SIZE%"=="0_5M" goto label2
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 5007ffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 20 c
goto label0
:label2
if not "%F_SIZE%"=="1_0M" goto label3
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 500fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 30 c
goto label0
:label3
if not "%F_SIZE%"=="2_0M" goto label4
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 501fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 40 c
goto label0
:label4
if not "%F_SIZE%"=="3_0M" goto label5
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 502fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 50 c
goto label0
:label5
if not "%F_SIZE%"=="4_0M" goto label6
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 503fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 60 c
goto label0
:label6
if not "%F_SIZE%"=="5_0M" goto label7
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 504fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 70 c
goto label0
:label7
if not "%F_SIZE%"=="6_0M" goto label8
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 505fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 80 c
goto label0
:label8
if not "%F_SIZE%"=="1_5M" goto label9
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 5017ffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 90 c
goto label0
:label9
if not "%F_SIZE%"=="2_5M" goto label10
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 5027ffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat A0 c
goto label0
:label10
if not "%F_SIZE%"=="3_5M" goto label11
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 5037ffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat B0 c
goto label0
:label11
if not "%F_SIZE%"=="7_0M" goto label12
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 506fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat C0 c
goto label0
:label12
if not "%F_SIZE%"=="8_0M" goto label13
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 507fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat D0 c
goto label0
:label13
if not "%F_SIZE%"=="9_0M" goto label14
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 508fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat E0 c
goto label0
:label14
if not "%F_SIZE%"=="A_0M" goto label15
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 509fffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat F0 c
goto label0
:label15
if not "%F_SIZE%"=="B_0M" goto label16
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50afffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 100 c
goto label0
:label16
if not "%F_SIZE%"=="C_0M" goto label17
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50bfffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 110 c
goto label0
:label17
if not "%F_SIZE%"=="D_0M" goto label18
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50cfffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 120 c
goto label0
:label18
if not "%F_SIZE%"=="E_0M" goto label19
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50dfffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 130 c
goto label0
:label19
if not "%F_SIZE%"=="F_0M" goto label20
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50efffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 140 c
goto label0
:label20
if not "%F_SIZE%"=="16MB" goto label21
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 50ffffff -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat 150 c
goto label0
:label21
if not "%F_SIZE%"=="AUTO" goto label22
%E2B% ..\HEAD_TSK.elf cexe.bn1 50000000 5FROM_END -Xbss
%BMG% cexe.bn1 100 ..\%TOOLPATH%\bindata.dat FROM_NAME c
goto label0
:label22

:label0

%BMG% cexe.bn1 160 ..\%TOOLPATH%\bindata.dat 0 14
copy /b ..\%TOOLPATH%\rom_head.bin cexe.bn2 > NUL
#[1]
%E2B% ..\task1.elf task1.bn1  5TASK1_TOP 5TASK1_END -Xbss
%E2B% ..\task1.elf main1adr.bn1 50000160 50000163 -Xbss
%BMG% cexe.bn1 TASK1_TOP task1.bn1 0 TASK1_LEN
%BMG% cexe.bn1 160 main1adr.bn1 0 4
#[2]
%E2B% ..\task2.elf task2.bn1  5TASK2_TOP 5TASK2_END -Xbss
%E2B% ..\task2.elf main2adr.bn1 50000164 50000167 -Xbss
%BMG% cexe.bn1 TASK2_TOP task2.bn1 0 TASK2_LEN
%BMG% cexe.bn1 164 main2adr.bn1 0 4
#[3]
%E2B% ..\task3.elf task3.bn1  5TASK3_TOP 5TASK3_END -Xbss
%E2B% ..\task3.elf main3adr.bn1 50000168 5000016B -Xbss
%BMG% cexe.bn1 TASK3_TOP task3.bn1 0 TASK3_LEN
%BMG% cexe.bn1 168 main3adr.bn1 0 4
#[4]
%E2B% ..\task4.elf task4.bn1  5TASK4_TOP 5TASK4_END -Xbss
%E2B% ..\task4.elf main4adr.bn1 5000016C 5000016F -Xbss
%BMG% cexe.bn1 TASK4_TOP task4.bn1 0 TASK4_LEN
%BMG% cexe.bn1 16c main4adr.bn1 0 4
#[5]
%E2B% ..\task5.elf task5.bn1  5TASK5_TOP 5TASK5_END -Xbss
%E2B% ..\task5.elf main5adr.bn1 50000170 50000173 -Xbss
%BMG% cexe.bn1 TASK5_TOP task5.bn1 0 TASK5_LEN
%BMG% cexe.bn1 170 main5adr.bn1 0 4
#[6]
%E2B% ..\task6.elf task6.bn1  5TASK6_TOP 5TASK6_END -Xbss
%E2B% ..\task6.elf main6adr.bn1 50000174 50000177 -Xbss
%BMG% cexe.bn1 TASK6_TOP task6.bn1 0 TASK6_LEN
%BMG% cexe.bn1 174 main6adr.bn1 0 4
#[]

copy /b cexe.bn2 + cexe.bn1 > NUL
@rem popd
cd ..

if not defined APL_ID set APL_ID="1"

:l_apl1
if not %APL_ID%=="1" goto l_apl2
set NEWMEMFILE=cexec.mem
goto l_generate

:l_apl2
if not %APL_ID%=="2" goto l_apl3
set NEWMEMFILE=cexe2.mem
goto l_generate

:l_apl3
if not %APL_ID%=="3" goto l_generate
set NEWMEMFILE=cexe3.mem
goto l_generate

:l_generate
if exist %NEWMEMFILE% del %NEWMEMFILE% > NUL

copy %BIN_PATH%\cexe.bn2 %NEWMEMFILE% > NUL

if not "%F_SIZE%"=="AUTO" goto l_edram
%WR_HEAD% %NEWMEMFILE% 18A UNIT_SIZE 2 > NUL

:l_edram
if not "%E_DRAM%"=="ON" goto l_prot
%WR_HEAD% %NEWMEMFILE% 1AE 1 1 > NUL

:l_prot
if not "%M_PROT%"=="ON" goto l_sram
%PRT% %NEWMEMFILE%

:l_sram
%WR_HEAD% %NEWMEMFILE% 248 SRAM_TOP 4 > NUL
%WR_HEAD% %NEWMEMFILE% 24C SRAM_ALEN 4 > NUL

:l_aplchg

if exist %BIN_PATH%\cexec.apl del %BIN_PATH%\cexec.apl > NUL

REM Check if .NET Framework 3.5 is installed
reg query "HKLM\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5" /s >nul 2>&1
if %errorlevel% neq 0 (
    echo .NET Framework 3.5 not installed. Install before proceeding!.
    exit /b 1
)

REM Print on command line
echo %MLT% %NEWMEMFILE% %BIN_PATH%\cexec.apl %APL_ID% -c

REM Executed without NUL redirection
%MLT% %NEWMEMFILE% %BIN_PATH%\cexec.apl %APL_ID% -c

%CRC% -i%BIN_PATH%\cexec.apl -o%BIN_PATH%\cexec.crc > NUL
copy %BIN_PATH%\cexec.crc %NEWMEMFILE% > NUL
