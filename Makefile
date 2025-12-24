# This makefile is for NMAKE.EXE

#------------------------------------------------------------------------------
# Task definition block. Modify here for your application.
#------------------------------------------------------------------------------

TASK1 = tsk1main.o # List the names of the object files making up the main task.
TASK2 = tsk2main.o # List the names of the object files making up the communication task.
TASK3 = tsk3main.o # List the names of the object files making up the alarm task.
TASK4 = tsk4main.o # List the names of the object files making up the window task.
TASK5 = tsk5main.o # List the names of the object files making up the High-Level task.
TASK6 = tsk6main.o # List the names of the object files making up the Middle-Level task.

#------------------------------------------------------------------------------
# MEM setting definition block.
#------------------------------------------------------------------------------

# Select one of the following FROMSIZE variables according to F-ROM size.
# Remove the leading comment mark (#) of the selected FROMSIZE variable.

# FROMSIZE = 0_5M       # MEMORY CARD  0.5MB - NOT TESTED
FROMSIZE = 1_0M       # MEMORY CARD  1.0MB
# FROMSIZE = 1_5M       # MEMORY CARD  1.5MB - NOT TESTED
# FROMSIZE = 2_0M       # MEMORY CARD  2.0MB - NOT TESTED
# FROMSIZE = 2_5M       # MEMORY CARD  2.5MB - NOT TESTED
# FROMSIZE = 3_0M       # MEMORY CARD  3.0MB - NOT TESTED
# FROMSIZE = 3_5M       # MEMORY CARD  3.5MB - NOT TESTED
# FROMSIZE = 4_0M       # MEMORY CARD  4.0MB - NOT TESTED
# FROMSIZE = 5_0M       # MEMORY CARD  5.0MB - NOT TESTED
# FROMSIZE = 6_0M       # MEMORY CARD  6.0MB - NOT TESTED
# FROMSIZE = 7_0M       # MEMORY CARD  7.0MB - NOT TESTED
# FROMSIZE = 8_0M       # MEMORY CARD  8.0MB - NOT TESTED
# FROMSIZE = 9_0M       # MEMORY CARD  9.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = A_0M       # MEMORY CARD 10.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = B_0M       # MEMORY CARD 11.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = C_0M       # MEMORY CARD 12.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = D_0M       # MEMORY CARD 13.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = E_0M       # MEMORY CARD 14.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = F_0M       # MEMORY CARD 15.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = 16MB       # MEMORY CARD 16.0MB for FS30iB/FS0i-F only - NOT TESTED
# FROMSIZE = AUTO       # MEMORY CARD SIZE AUTO ADJUST

# Select one of the following SRAM_LEN variables according to S-RAM size.
# Remove the leading comment mark (#) of the selected SRAM_LEN variable.

# SRAM_LEN = EC00         # SRAM 64kB - NOT TESTED
# SRAM_LEN = 3EC00      # SRAM 256kB 
SRAM_LEN = 7EC00      # SRAM 512kB for FS30iB/FS0i-F only

# Please select the following "EXP_DRAMSIZE" for DRAM size used in C Executor
# Remove the leading comment mark (#) of the selected EXP_DRAMSIZE variable.

EXP_DRAMSIZE = OFF      # 6MB or less
# EXP_DRAMSIZE = ON     # larger than 6MB - NOT TESTED

# SYS_TYPE for executing CNC system.
# SYS_TYPE = FS30iA       # for FANUC Series 30i/31i/32i MODEL-A - NOT TESTED
SYS_TYPE = FS30iB       # for FANUC Series 30i-MODEL B

# Please select the following "PMCMEM_D" for PMC memory type used in C Executor.
# Remove the leading comment mark (#) of the selected PMCMEM_D variable.

#PMCMEM_D = OFF          # PMC memory A or PMC memory B or PMC memory C - NOT TESTED
PMCMEM_D = ON          # PMC memory A or PMC memory B or PMC memory C or PMC memory D

# Please select the following "PROTECT" for the protection function of C Executor
# Remove the leading comment mark (#) of the selected PROTECT variable.

PROTECT = OFF           # Protection OFF
# PROTECT = ON          # Protection ON - NOT TESTED

# Please select the following "APL_ID" for the multi execution of C Executor.
# Remove the leading comment mark (#) of the selected APL_ID variable.

APL_ID = 1              # Application id 1
# APL_ID = 2            # Application id 2 - NOT TESTED
# APL_ID = 3            # Application id 3 - NOT TESTED

#------------------------------------------------------------------------------
# SRAM top address definition block.
#------------------------------------------------------------------------------

!IF     "$(SYS_TYPE)" == "FS30iA"
!IF     "$(FROMSIZE)" == "9_0M" || "$(FROMSIZE)" == "A_0M" || \
        "$(FROMSIZE)" == "B_0M" || "$(FROMSIZE)" == "C_0M" || \
        "$(FROMSIZE)" == "D_0M" || "$(FROMSIZE)" == "E_0M" || \
        "$(FROMSIZE)" == "F_0M" || "$(FROMSIZE)" == "16MB"
!ERROR FROMSIZE is bigger than 8MB
!ENDIF
!IF     "$(EXP_DRAMSIZE)" == "ON"
SRAM_TOP = 50A00000
!ELSE
!IF     "$(FROMSIZE)" == "7_0M" || "$(FROMSIZE)" == "8_0M" || \
        "$(FROMSIZE)" == "AUTO"
EXP_DRAMSIZE = ON
SRAM_TOP = 50A00000
!ELSE
SRAM_TOP = 50800000
!ENDIF
!ENDIF

!ELSEIF "$(SYS_TYPE)" == "FS30iB"
!IF     "$(EXP_DRAMSIZE)" == "ON"
SRAM_TOP = 51000000
!ELSE
!IF     "$(FROMSIZE)" == "7_0M" || "$(FROMSIZE)" == "8_0M" || \
        "$(FROMSIZE)" == "9_0M" || "$(FROMSIZE)" == "A_0M"
EXP_DRAMSIZE = ON
SRAM_TOP = 50A00000
!ELSEIF "$(FROMSIZE)" == "B_0M" || "$(FROMSIZE)" == "C_0M" || \
        "$(FROMSIZE)" == "D_0M" || "$(FROMSIZE)" == "E_0M" || \
        "$(FROMSIZE)" == "F_0M" || "$(FROMSIZE)" == "16MB" || \
        "$(FROMSIZE)" == "AUTO"
EXP_DRAMSIZE = ON
SRAM_TOP = 51000000
!ELSE
SRAM_TOP = 50800000
!ENDIF
!ENDIF

!ELSE
!ERROR SYS_TYPE is illegal setting.
!ENDIF

#------------------------------------------------------------------------------
# Environment variable definition block.
#------------------------------------------------------------------------------
CEXE_LIB = .\FANUCLIB # FANUC LIBRARY PATH

TOOL = $(CEXE_LIB)\tool
FCLIB = $(CEXE_LIB)\lib
FCINC = $(CEXE_LIB)\inc

#------------------------------------------------------------------------------
# FANUC target and panel specification
#------------------------------------------------------------------------------

FANUC_TARGET = FS30
PANEL_TARGET = FPNL_DEFAULT
#------------------------------------------------------------------------------
# Custom const definition block
#------------------------------------------------------------------------------

DEST    = -D $(FANUC_TARGET) -D $(PANEL_TARGET) 
FLAGS1  = -D PMCMEMD 
FLAGS2  = -D DISPLAY -D F22_TYPE5 -D LOCAL_DATA_AREA_STATIC_ONLY

!IF "$(PMCMEM_D)" == "ON"
CC = powerpc-eabi-gcc -mcpu=603e -Wall -nostdlib -O2 -I $(FCINC) $(DEST) $(FLAGS1) -c 
!ELSE
CC = powerpc-eabi-gcc -mcpu=603e -Wall -nostdlib -O2 -I $(FCINC) $(DEST) $(FLAGS2) -c 
!ENDIF

LINK = powerpc-eabi-ld -m elf32ppc #--no-gc-sections

SELEC = $(TOOL)\SELECTXT

RAMOBJ  =
TASKID  =
TASKALL =
CHK_LEN =

SRAMINFO = .\STEP1\SRAMINF.DAT
STEP1LNK = .\STEP1\STEP1.DAT
TASK1LEN = .\STEP1\TASK1LEN.DAT
TASK2LEN = .\STEP1\TASK2LEN.DAT
TASK3LEN = .\STEP1\TASK3LEN.DAT
TASK4LEN = .\STEP1\TASK4LEN.DAT
TASK5LEN = .\STEP1\TASK5LEN.DAT
TASK6LEN = .\STEP1\TASK6LEN.DAT
TASKALEN = .\STEP2\TASKALEN.DAT

!IF "$(TASK1)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK1LEN)
TASKALL = $(TASKALL) TASK1.ELF
TASKID  = $(TASKID) 1
!ENDIF

!IF "$(TASK2)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK2LEN)
TASKALL = $(TASKALL) TASK2.ELF
TASKID  = $(TASKID) 2
!ENDIF

!IF "$(TASK3)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK3LEN)
TASKALL = $(TASKALL) TASK3.ELF
TASKID  = $(TASKID) 3
!ENDIF

!IF "$(TASK4)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK4LEN)
TASKALL = $(TASKALL) TASK4.ELF
TASKID  = $(TASKID) 4
!ENDIF

!IF "$(TASK5)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK5LEN)
TASKALL = $(TASKALL) TASK5.ELF
TASKID  = $(TASKID) 5
!ENDIF

!IF "$(TASK6)" != ""
CHK_LEN  = $(CHK_LEN) $(TASK6LEN)
TASKALL = $(TASKALL) TASK6.ELF
TASKID  = $(TASKID) 6
!ENDIF

!IF EXISTS(VERSION.c)
RAMOBJ  = $(RAMOBJ)  VERSION.o
TASKID  = $(TASKID) V
!ENDIF

!IF EXISTS(SRAMVER.c)
RAMOBJ  = $(RAMOBJ)  SRAMVER.o
TASKID  = $(TASKID) S
!ENDIF

!IF EXISTS(DRAMVER.c)
RAMOBJ  = $(RAMOBJ)  DRAMVER.o
TASKID  = $(TASKID) D
!ENDIF

FOLDER = .\map .\step1 .\step2 .\step3 

#------------------------------------------------------------------------------
# Application id definition block.
#------------------------------------------------------------------------------

!IF "$(APL_ID)" != "1" && \
    "$(APL_ID)" != "2" && \
    "$(APL_ID)" != "3"
!ERROR Error: Application ID is incorrect.
!ENDIF

#------------------------------------------------------------------------------

.c.o :
        $(CC) $*.c -o $*.o 

#------------------------------------------------------------------------------

CEXEC.MEM : $(FOLDER) $(TASKALL)
        echo @echo off> .\STEP3\SIZE_CHK.BAT
        echo set TOOLPATH=$(TOOL)>> .\STEP3\SIZE_CHK.BAT
        echo set F_SIZE=$(FROMSIZE)>> .\STEP3\SIZE_CHK.BAT
        echo set S_TYPE=$(SYS_TYPE)>> .\STEP3\SIZE_CHK.BAT
        $(TOOL)\SED -f $(TASKALEN) $(TOOL)\SIZE_CHK.DAT >> .\STEP3\SIZE_CHK.BAT
        .\STEP3\SIZE_CHK.BAT

        $(SELEC) .\STEP3\MAKE_MEM.DAT MAKE_MEM.BAT $(TASKID)
        echo @echo off> .\STEP3\MAKE_MEM.BAT
        echo set TOOLPATH=$(TOOL)>> .\STEP3\MAKE_MEM.BAT
        echo set F_SIZE=$(FROMSIZE)>> .\STEP3\MAKE_MEM.BAT
        echo set E_DRAM=$(EXP_DRAMSIZE)>> .\STEP3\MAKE_MEM.BAT
        echo set M_PROT=$(PROTECT)>> .\STEP3\MAKE_MEM.BAT
        echo set APL_ID="$(APL_ID)">> .\STEP3\MAKE_MEM.BAT
        $(TOOL)\SED -f $(TASKALEN) .\STEP3\MAKE_MEM.DAT >> .\STEP3\MAKE_MEM.BAT
        .\STEP3\MAKE_MEM.BAT

#------------------------------------------------------------------------------

$(STEP1LNK) :
        echo s/SRAM_LEN/$(SRAM_LEN)/g > $(SRAMINFO)
        echo s/SRAM_TOP/$(SRAM_TOP)/g >> $(SRAMINFO)
        $(TOOL)\SED -f $(SRAMINFO) $(TOOL)\STEP1_adr.LNK > $(STEP1LNK)

#------------------------------------------------------------------------------

.\STEP1\STEP1_1.MAP : $(TASK1) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_1.LNK $(STEP1LNK) 1
        @echo LINKING STEP 1_1...
        $(LINK) -T .\STEP1\STEP1_1.LNK -o .\STEP1\STEP1_1.ELF $(TASK1) $(RAMOBJ) $(FCLIB)\tsk1_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_1.MAP
		
$(TASK1LEN) : .\STEP1\STEP1_1.MAP
        $(TOOL)\GAWK -v task=1 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_1.MAP > $(TASK1LEN)

#------------------------------------------------------------------------------

.\STEP1\STEP1_2.MAP : $(TASK2) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_2.LNK $(STEP1LNK) 2
        @echo LINKING STEP 1_2...
        $(LINK) -T .\STEP1\STEP1_2.LNK -o .\STEP1\STEP1_2.ELF $(TASK2) $(RAMOBJ) $(FCLIB)\tsk2_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_2.MAP

$(TASK2LEN) : .\STEP1\STEP1_2.MAP
        $(TOOL)\GAWK -v task=2 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_2.MAP > $(TASK2LEN)

#------------------------------------------------------------------------------

.\STEP1\STEP1_3.MAP : $(TASK3) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_3.LNK $(STEP1LNK) 3
        @echo LINKING STEP 1_3...
        $(LINK) -T .\STEP1\STEP1_3.LNK -o .\STEP1\STEP1_3.ELF $(TASK3) $(RAMOBJ) $(FCLIB)\tsk3_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_3.MAP

$(TASK3LEN) : .\STEP1\STEP1_3.MAP
        $(TOOL)\GAWK -v task=3 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_3.MAP > $(TASK3LEN)

#------------------------------------------------------------------------------

.\STEP1\STEP1_4.MAP : $(TASK4) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_4.LNK $(STEP1LNK) 4
        @echo LINKING STEP 1_4...
        $(LINK) -T .\STEP1\STEP1_4.LNK -o .\STEP1\STEP1_4.ELF $(TASK4) $(RAMOBJ) $(FCLIB)\tsk4_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_4.MAP

$(TASK4LEN) : .\STEP1\STEP1_4.MAP
        $(TOOL)\GAWK -v task=4 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_4.MAP > $(TASK4LEN)

#------------------------------------------------------------------------------

.\STEP1\STEP1_5.MAP : $(TASK5) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_5.LNK $(STEP1LNK) 5
        @echo LINKING STEP 1_5...
        $(LINK) -T .\STEP1\STEP1_5.LNK -o .\STEP1\STEP1_5.ELF $(TASK5) $(RAMOBJ) $(FCLIB)\tsk5_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_5.MAP

$(TASK5LEN) : .\STEP1\STEP1_5.MAP
        $(TOOL)\GAWK -v task=5 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_5.MAP > $(TASK5LEN)

#------------------------------------------------------------------------------

.\STEP1\STEP1_6.MAP : $(TASK6) $(RAMOBJ) $(STEP1LNK)
        $(TOOL)\SELECTXT .\STEP1\STEP1_6.LNK $(STEP1LNK) 6
        @echo LINKING STEP 1_5...
        $(LINK) -T .\STEP1\STEP1_6.LNK -o .\STEP1\STEP1_6.ELF $(TASK6) $(RAMOBJ) $(FCLIB)\tsk6_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\STEP1\STEP1_6.MAP

$(TASK6LEN) : .\STEP1\STEP1_6.MAP
        $(TOOL)\GAWK -v task=6 -f $(TOOL)\CHK_LEN1.AWK .\STEP1\STEP1_6.MAP > $(TASK6LEN)

#------------------------------------------------------------------------------

$(TASKALEN) : $(CHK_LEN)
        echo s/SRAM_LEN/$(SRAM_LEN)/g > $(TASKALEN)
        echo s/SRAM_TOP/$(SRAM_TOP)/g >> $(TASKALEN)
        $(TOOL)\GAWK -f $(TOOL)\CHK_LEN2.AWK $(CHK_LEN) >> $(TASKALEN)

#------------------------------------------------------------------------------

TASK1.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK1.DAT $(TOOL)\STEP2_adr.LNK 1
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK1.DAT > .\STEP2\TASK1.LNK							   
        $(LINK) -T .\STEP2\TASK1.LNK   -o TASK1.ELF $(TASK1) $(RAMOBJ) $(FCLIB)\tsk1_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task1.map

#------------------------------------------------------------------------------

TASK2.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK2.DAT $(TOOL)\STEP2_adr.LNK 2
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK2.DAT > .\STEP2\TASK2.LNK										   
        $(LINK) -T .\STEP2\TASK2.LNK   -o TASK2.ELF $(TASK2) $(RAMOBJ) $(FCLIB)\tsk2_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task2.map

#------------------------------------------------------------------------------

TASK3.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK3.DAT $(TOOL)\STEP2_adr.LNK 3
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK3.DAT > .\STEP2\TASK3.LNK										   
        $(LINK) -T .\STEP2\TASK3.LNK   -o TASK3.ELF $(TASK3) $(RAMOBJ) $(FCLIB)\tsk3_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task3.map

#------------------------------------------------------------------------------

TASK4.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK4.DAT $(TOOL)\STEP2_adr.LNK 4
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK4.DAT > .\STEP2\TASK4.LNK								   
        $(LINK) -T .\STEP2\TASK4.LNK   -o TASK4.ELF $(TASK4) $(RAMOBJ) $(FCLIB)\tsk4_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task4.map

#------------------------------------------------------------------------------

TASK5.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK5.DAT $(TOOL)\STEP2_adr.LNK 5
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK5.DAT > .\STEP2\TASK5.LNK											   
        $(LINK) -T .\STEP2\TASK5.LNK   -o TASK5.ELF $(TASK5) $(RAMOBJ) $(FCLIB)\tsk5_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task5.map

#------------------------------------------------------------------------------

TASK6.ELF : $(TASKALEN)
        $(SELEC) .\STEP2\TASK6.DAT $(TOOL)\STEP2_adr.LNK 6
        $(TOOL)\SED -f $(TASKALEN) .\STEP2\TASK6.DAT > .\STEP2\TASK6.LNK										   
        $(LINK) -T .\STEP2\TASK6.LNK   -o TASK6.ELF $(TASK6) $(RAMOBJ) $(FCLIB)\tsk6_lib.o $(FCLIB)\cexe_lib.o $(FCLIB)\jump_tbl.o -Map .\map\task6.map

#------------------------------------------------------------------------------

.\map:
        if not exist .\map\nul mkdir map

.\step1:
        if not exist .\step1\nul mkdir step1

.\step2:
        if not exist .\step2\nul mkdir step2

.\step3:
        if not exist .\step3\nul mkdir step3

#------------------------------------------------------------------------------
# .O and .C dependency block.
#------------------------------------------------------------------------------

dramver.o  : dramver.c
sramver.o  : sramver.c

tsk1main.o : tsk1main.c # Describe the dependency of main task files.
tsk2main.o : tsk2main.c # Describe the dependency of communication task files.
tsk3main.o : tsk3main.c # Describe the dependency of alarm task files.
tsk4main.o : tsk4main.c # Describe the dependency of window task files.
tsk5main.o : tsk5main.c # Describe the dependency of High-Level task files.
tsk6main.o : tsk6main.c # Describe the dependency of Middle-Level task files.

#------------------------------------------------------------------------------
# End of .O and .C dependency block.
#------------------------------------------------------------------------------

# END
