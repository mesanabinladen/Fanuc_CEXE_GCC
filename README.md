# GCC toolchain for FANUC C-Executor #

This repository provides an unofficial Windows based toolchain, enabling you to compile C programs for CNC FANUC 30i series controllers (and maybe some other old model too). This project is not affiliated with or officially endorsed by FANUC. Instead of relying on commercial compilers like Diab-Compiler, this repository contains a Makefile for NMAKE in Windows leverages the GCC toolchain to build and generate C-EXE executables.

## Prerequisites ##

1-Windows OS (tested on Windows 11)

2-nmake.exe (provided, or installed with Visual Studio or as a [standalone tool](https://visualstudio.microsoft.com/it/downloads/#build-tools-for-visual-studio-2022))

3-[.NET Framework 3.5](https://www.microsoft.com/it-it/download/details.aspx?id=21) 

4-Before using this Makefile, you must install the required GCC toolchain for PowerPC. You can download it from the following link: [PowerPC EABI Toolchain](https://gnutoolchains.com/powerpc-eabi/)

Tested with version 4.9. Remember to add .bin folder to PATH using Powershell:  
```powershell
$env:PATH = "C:\SysGCC\powerpc-eabi\bin;" + $env:PATH
```

## Features ##

Cross-compilation: Utilizes GCC for PowerPC targets.

Memory configuration: Supports various memory configurations for the CNC FANUC 30i series.

Customizable: Easily adapt the Makefile for your specific needs.

## Usage ##

1-Clone this repository:
```bash
git clone https://github.com/mesanabinladen/Fanuc_CEXE_GCC.git
cd Fanuc_CEXE_GCC
```
2-Install the PowerPC EABI toolchain from the link above and ensure it is added to your system's PATH.

3-You can define custom configurations for memory management or other specific requirements. Refer to the Makefile for existing examples and modify as needed.

4-Add or modify your code in:
	
	task1main.c
	task2main.c
	task3main.c
	task4main.c
	task5main.c
	task6main.c
	sramver.c
	dramver.c
	version.c

	IMPORTANT: the program entry point is not `main()` but `task_start()`.

5-Run the following command:
```powershell
.\compile.bat
```

## Notes ##

This project is intended for educational and non-commercial use.
Verify FANUC CNC compatibility before deploying generated binaries.

## Disclaimer ##

This project is not affiliated with, endorsed by, or associated with FANUC. Use at your own risk.

## License

See the LICENSE file for license details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.