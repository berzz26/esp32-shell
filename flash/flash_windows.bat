@echo off
set PORT=%1
if "%PORT%"=="" set PORT=COM7

python -m esptool --chip esp32 --port %PORT% --baud 460800 write-flash ^
  0x1000 bin\esp-shell.bootloader.bin ^
  0x8000 bin\esp-shell.partitions.bin ^
  0x10000 bin\esp-shell.bin
