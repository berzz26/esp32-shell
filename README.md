# ESP32 CLI Tool

A simple and powerful command-line tool running on ESP32 that allows users to interact with their board via serial commands. You can scan and connect to Wi-Fi, toggle GPIOs, and perform basic ESP32 tasks using a serial terminal.

---

##  Features

* Wi-Fi scan & connect
* GPIO read/write
* Built-in shell with help command
* Lightweight and fast

---

##  Requirements

* ESP32 board
* USB cable for flashing
* `esptool.py` installed (use `pip install esptool`)
* A terminal program (e.g., `minicom`, `screen`, `PuTTY`)

---

## ⬇ How to Flash

The following `.bin` files should be present in the repository:

```
esp-shell.ino.bootloader.bin
esp-shell.ino.partitions.bin
esp-shell.ino.bin
```

### Step 1: Erase Flash (Optional but Recommended)
> **Caution** your flash memory will be erased

#### On Linux/macOS

```bash
esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash
```

#### On Windows

```cmd
python -m esptool --chip esp32 --port COM7 erase_flash
```

### Step 2: Flash the Binaries

#### On Linux/macOS

```bash
esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 460800 \
  write_flash -z 0x1000 esp-shell.ino.bootloader.bin \
               0x8000 esp-shell.ino.partitions.bin \
               0x10000 esp-shell.ino.bin
```

#### On Windows

```cmd
python -m esptool --chip esp32 --port COM7 --baud 460800 write-flash ^
  0x1000 esp-shell.ino.bootloader.bin ^
  0x8000 esp-shell.ino.partitions.bin ^
  0x10000 esp-shell.ino.bin
```

> Replace `/dev/ttyUSB0` with your actual COM port on Linux/macOS and `COM7` with the appropriate COM port on Windows.
> Make sure to run this commands in terminal where the files of the current repo are present

---

##  Usage

Once flashed:

1. Open a serial monitor at baud rate `115200`. (in the arduinoIDE)
2. Type `help` to see available commands.

### Sample Commands

```bash
help
wifi_scan
wifi_connect MySSID MyPassword
gpio_read 5
gpio_write 5 1
```

---

## Future Plans

* Add file system support
* OTA updates
* More GPIO utilities

---

##  Contributing

Feel free to fork and PR!

---


