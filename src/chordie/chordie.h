#ifndef CHORDIE_H
#define CHORDIE_H

#include <stdint.h>
#include <stdbool.h>
#include "quantum.h"
#include "i2c_master.h"

/* I2C expander config */
#define I2CR_ADDRESS 0x27 << 1
#define I2CL_ADDRESS 0x20 << 1
#define I2C_TIMEOUT 1000

/* I/O Direction registers 
 * Specs say 1111111 on boot p.18
 * so all as inputs
 */
#define IODIRA 0x00
#define IODIRB 0x01

/*
 * Pull-up configuration register 
*/
#define GPPUA 0x0C
#define GPPUB 0x0D

/* I/O state register
 * This is where we read our data
*/
#define GPIOA 0x12
#define GPIOB 0x13

void i2c_initialize(void);
bool isI2C_initialized(void);

void i2c_write8(uint8_t addr, uint8_t reg, uint8_t data);
uint8_t i2c_read8(uint8_t addr, uint8_t reg);
void i2c_select_row(uint8_t row_index);
void i2c_select_row_on(uint8_t addr, uint8_t row_index);

i2c_status_t i2c_last_error(void);

#define LAYOUT(\
					LIR,				 RIR,\
					LEU,\
					LES,\
					LED,\
		 L1, L2, L3, L4,				 R1, R2, R3, R4,\
		 			L5,					 R5,\
					L6, 				 R6,\
					L7,					 R7,\
					L8,					 R8\
)\
{\
	{LED, LEU, RIR, R4, R3, R2, R1, R5, R6, R7, R8, LIR, LES, L8, L7, L6, L5, L4, L3, L2, L1}\
} 
#endif