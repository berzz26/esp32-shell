#!/bin/bash
PORT=${1:-/dev/ttyUSB0}
BAUD=${2:-460800}

esptool.py --chip esp32 --port "$PORT" --baud "$BAUD" write_flash -z \
  0x1000 bin/esp-shell.bootloader.bin \
  0x8000 bin/esp-shell.partitions.bin \
  0x10000 bin/esp-shell.bin
