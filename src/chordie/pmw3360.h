#pragma once
void pmw_begin(void);

void pmw_end(void);

void pmw_write(uint8_t reg_addr, uint8_t data);

uint8_t pmw_read(uint8_t reg_addr);

void pointing_device_init(void);

int16_t convertDeltaToInt(uint8_t high, uint8_t low);

void readSensor(void);

void pointing_device_task(void);
