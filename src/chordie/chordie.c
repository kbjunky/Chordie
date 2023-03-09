#include "chordie.h"

#define HIGH 0b11111111
#define LOW 0

#define SCROLLV_TRESHOLD 8
#define SCROLLH_TRESHOLD 8
#define VOLUME_TRESHOLD 16
#define BALL_SCROLL 5
#define BALL_VOLUME (BALL_SCROLL + 1)

static i2c_status_t last_err = 0;
bool i2c_initialized = false;

int8_t scrollv=0;
int8_t scrollh=0;

extern uint8_t current_pseudolayer;

void i2c_initialize(void){
    dprint("I2C init start\n");
    if(!i2c_initialized) {
        i2c_init();
        i2c_initialized = true;
        
    }

    //1st device
    //set A as outputs
    i2c_write8(I2CR_ADDRESS, IODIRA, HIGH);
    i2c_write8(I2CR_ADDRESS, IODIRB, HIGH);
    //seems like A pull ups also needed
    i2c_write8(I2CR_ADDRESS, GPPUA, HIGH);
    //set B pull ups ON
    i2c_write8(I2CR_ADDRESS, GPPUB, 0b11101111);

    if(i2c_last_error()) {
        dprint("Unable to setup left side!\n");
    }else {
        dprint("Left side OK!\n");
    } 
    
    //2nd device 
    i2c_write8(I2CL_ADDRESS, IODIRA, HIGH);
    i2c_write8(I2CL_ADDRESS, IODIRB, HIGH);
    //seems like A pull ups also needed
    i2c_write8(I2CL_ADDRESS, GPPUA, HIGH);
    //set B pull ups ON 0b11101111
    i2c_write8(I2CL_ADDRESS, GPPUB, 0b11101111);
    if(i2c_last_error()) {
        dprint("Unable to setup right side!\n");
    }else {
        dprint("Left right OK!\n");
    }
}  

bool isI2C_initialized() {
    return i2c_initialized;
}

uint8_t i2c_read8(uint8_t addr, uint8_t reg) {
    uint8_t data = 0;
    last_err = i2c_start(addr, I2C_TIMEOUT); if(last_err) goto end;
    last_err = i2c_readReg(addr, reg, &data, sizeof(data), I2C_TIMEOUT); if(last_err) goto end;    
    end:
        i2c_stop();
    return ~data;

}

void i2c_write8(uint8_t addr, uint8_t reg, uint8_t data) {
    last_err = i2c_start(addr, I2C_TIMEOUT); if(last_err) goto end;
    last_err = i2c_writeReg(addr, reg, &data, sizeof(data), I2C_TIMEOUT); if(last_err) goto end;
    end:
        i2c_stop();
}

void i2c_select_row(uint8_t row_index) {
    uint8_t row_mask = ~(1 << row_index);
    i2c_write8(I2CR_ADDRESS, GPIOA, row_mask);
}

void i2c_select_row_on(uint8_t addr, uint8_t row_index) {
    uint8_t row_mask = ~(1 << row_index);
    i2c_write8(addr, GPIOA, row_mask);
} 

i2c_status_t i2c_last_error(void) {
    return last_err;
}

report_mouse_t pointing_device_task_user(report_mouse_t report) {   

    //scrollv
    if(current_pseudolayer==BALL_SCROLL) {
        if(report.y < 0) 
            scrollv--;
        if(report.y > 0)
            scrollv++;  

        if(report.x < 0)          
            scrollh--;
        if(report.x > 0)
            scrollh++;

        if((scrollv > SCROLLV_TRESHOLD) || (scrollv < -SCROLLV_TRESHOLD)) {
            if(scrollv > 0)
                report.v = -1;
            if(scrollv < 0)
                report.v = 1;

            scrollv = 0;
            scrollh = 0;
        }

        if((scrollh > SCROLLH_TRESHOLD) || (scrollh < -SCROLLH_TRESHOLD)) {
            if(scrollh > 0)
                report.h = 1;
            if(scrollh < 0)
                report.h = -1;

            scrollh = 0;
            scrollv = 0;
        }
       
        report.x = 0;
        report.y = 0;
        
    }

    //volume
    if(current_pseudolayer == BALL_VOLUME) {
        if(report.y < 0) 
            scrollv--;
        if(report.y > 0)
            scrollv++;
        
        if(scrollv > VOLUME_TRESHOLD) {
            tap_code(KC_VOLD);
            scrollv = 0;
        }

        if(scrollv < -VOLUME_TRESHOLD) {
            tap_code(KC_VOLU);
            scrollv  = 0;
        }
        report.x = 0;
        report.y = 0;                                                   
    }

    return report;
}
