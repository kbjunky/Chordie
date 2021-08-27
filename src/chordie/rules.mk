
# MCU name
MCU = atmega32u4
#F_CPU = 8000000

# Bootloader selection
#   Teensy       halfkay
#   Pro Micro    caterina
#   Atmel DFU    atmel-dfu
#   LUFA DFU     lufa-dfu
#   QMK DFU      qmk-dfu
#   ATmega32A    bootloadHID
#   ATmega328P   USBasp
BOOTLOADER = caterina

# Build Options
#   comment out to disable the options.
#
#BOOTMAGIC_ENABLE = yes	# Virtual DIP switch configuration(+1000)
MOUSEKEY_ENABLE = yes	# Mouse keys(+4700)
EXTRAKEY_ENABLE = yes	# Audio control and System control(+450)
#CONSOLE_ENABLE = yes	# Console for debug(+400)
#COMMAND_ENABLE = yes   # Commands for debug and configuration
CUSTOM_MATRIX = yes    # Remote matrix from the wireless bridge
# Do not enable SLEEP_LED_ENABLE. it uses the same timer as BACKLIGHT_ENABLE
# SLEEP_LED_ENABLE = yes  # Breathing sleep LED during USB suspend
#NKRO_ENABLE = no		# USB Nkey Rollover - not yet supported in LUFA
#BACKLIGHT_ENABLE = no  # Enable keyboard backlight functionality
# MIDI_ENABLE = YES 		# MIDI controls
#UNICODE_ENABLE = no 		# Unicode
# BLUETOOTH_ENABLE = yes # Enable Bluetooth with the Adafruit EZ-Key HID
#SPLIT_KEYBOARD = yes
#SPLIT_TRANSPORT = custom
#ENCODER_ENABLE = no
#OLED_DRIVER_ENABLE = no
#LEADER_ENABLE = no
#RGBLIGHT_ENABLE = yes
# NO_USB_STARTUP_CHECK = yes
POINTING_DEVICE_ENABLE = yes

SRC += adns.c matrix.c 
QUANTUM_LIB_SRC += spi_master.c i2c_master.c




