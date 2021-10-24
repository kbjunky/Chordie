#include "pmw3360.h"
#include "spi_master.h"
#include "debug.h"
#include "quantum.h"
#include "pointing_device.h"
#include "pmw3360_srom_a4.h"

//registers
#define REG_Motion                                  0x02
#define REG_Delta_X_L                               0x03
#define REG_Delta_X_H                               0x04
#define REG_Delta_Y_L                               0x05
#define REG_Delta_Y_H                               0x06
#define REG_Config2                                 0x10
#define REG_SROM_Enable                             0x13
#define REG_SROM_ID                                 0x2A
#define REG_Power_Up_Reset                          0x3A
#define REG_Motion_Burst                            0x50
#define REG_SROM_Load_Burst                         0x62

#define tSWW 180
#define tSWR 180

#define WRITE_OP 0x80
#define READ_OP 0x7F

#define NCS F7

#define SCROLL_TRESHOLD 8
#define VOLUME_TRESHOLD 16
//value from keymap.c->enum pseudolayer
#define BALL_SCROLL 5
#define BALL_VOLUME 6

extern const uint16_t firmware_length;
extern const uint8_t firmware_data[];

volatile int16_t delta_x;
volatile int16_t delta_y;
volatile uint8_t motion_ind=0;
int8_t scroll=0;
extern uint8_t current_pseudolayer;

enum motion_burst_propertr{
    motion = 0,
    observation,
    delta_x_l,
    delta_x_h,
    delta_y_l,
    delta_y_h,
    squal,
    raw_data_sum,
    maximum_raw_data,
    minimum_raw_data,
    shutter_upper,
    shutter_lower,
    end_data
};

void pmw_begin(void) {
    spi_start(NCS, false, 3, 4);
}

void pmw_end(void) {
    spi_stop();
}

void pmw_write(uint8_t reg_addr, uint8_t data) {
    pmw_begin();
    spi_write(reg_addr | WRITE_OP);
    wait_us(tSWW);
    spi_write(data);
    wait_us(tSWW);
    pmw_end();
}

uint8_t pmw_read(uint8_t reg_addr) {
    pmw_begin();
    spi_write(reg_addr & READ_OP);
    wait_us(tSWR);
    uint8_t data = spi_read();
    pmw_end(); 
    wait_us(tSWR);
    return data;
}

void pointing_device_init(void) {
    spi_init();
    pmw_begin();
    pmw_end();
    pmw_write(REG_Power_Up_Reset, 0x5A);
    wait_ms(50);
    pmw_read(REG_Motion);
    pmw_read(REG_Delta_X_L);
    pmw_read(REG_Delta_X_H);
    pmw_read(REG_Delta_Y_L);
    pmw_read(REG_Delta_Y_H);

    //firmware upload
    pmw_write(REG_Config2, 0x0);
    pmw_write(REG_SROM_Enable, 0x1D);
    wait_ms(10);
    pmw_write(REG_SROM_Enable, 0x18);

    pmw_begin();
    spi_write(REG_SROM_Load_Burst | WRITE_OP);
    wait_us(15);

    unsigned char c;
    for(int i = 0; i < firmware_length; i++) {
        c = (unsigned char) pgm_read_byte(firmware_data + i);
        spi_write(c);
        wait_us(15);
    }
    wait_us(200);
    pmw_end();

    pmw_write(REG_Config2, 0);
}

int16_t convertDeltaToInt(uint8_t high, uint8_t low){

    // join bytes into twos compliment
    int16_t twos_comp = (high << 8) | low;

    // convert twos comp to int
    if (twos_comp & 0x8000)
        return -((~twos_comp) + 1);

    return twos_comp;
}

void readSensor(void)  {
    pmw_begin();
    spi_write(REG_Motion_Burst & READ_OP);
    wait_us(35);
    uint8_t burst_data[end_data];

    for(int i = 0; i < end_data; i++) {
        burst_data[i] = spi_read();
    }

    pmw_end();
    wait_us(1);

    motion_ind = burst_data[motion_ind] & 0b10000000;
    if(motion_ind) {
        delta_x = convertDeltaToInt(burst_data[delta_x_h], burst_data[delta_x_l]);
        delta_y = convertDeltaToInt(burst_data[delta_y_h], burst_data[delta_y_l]);
    }
}

void pointing_device_task(void) {
    
    report_mouse_t report = pointing_device_get_report();
    readSensor();
    
    if(motion_ind) {
       
        // clamp deltas from -127 to 127
        report.x = delta_y < -127 ? -127 : delta_y > 127 ? 127 : delta_y;
        report.x = report.x;        
        report.y = delta_x < -127 ? -127 : delta_x > 127 ? 127 : delta_x;
        report.y = report.y;
        
        if((current_pseudolayer != BALL_SCROLL) && (current_pseudolayer != BALL_VOLUME)) {
            pointing_device_set_report(report);
            pointing_device_send();         
        }

        //scroll
        if(current_pseudolayer == BALL_SCROLL) {
            if(report.y < 0) 
                scroll--;
            if(report.y > 0)
                scroll++;            

            if(scroll > SCROLL_TRESHOLD) {
                tap_code16(KC_MS_WH_DOWN);                
                scroll = 0;
                
            }

            if(scroll < -SCROLL_TRESHOLD) {
                tap_code16(KC_MS_WH_UP);                
                scroll  = 0;
            }
        }

        //volume
        if(current_pseudolayer == BALL_VOLUME) {
            if(report.y < 0) 
                scroll--;
            if(report.y > 0)
                scroll++;
            
            if(scroll > VOLUME_TRESHOLD) {
                tap_code(KC_VOLD);
                scroll = 0;
            }

            if(scroll < -VOLUME_TRESHOLD) {
                tap_code(KC_VOLU);
                scroll  = 0;
            }
        }
    }        
        

        
    // reset deltas
    delta_x = 0;
    delta_y = 0;

}
