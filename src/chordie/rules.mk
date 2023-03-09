
# MCU name
MCU = atmega32u4

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
CUSTOM_MATRIX = yes    # Remote matrix from the wireless bridge
POINTING_DEVICE_ENABLE = yes
POINTING_DEVICE_DRIVER = pmw3360

SRC += matrix.c 
QUANTUM_LIB_SRC += spi_master.c i2c_master.c




