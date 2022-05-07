#include "matrix.h"
#include QMK_KEYBOARD_H

#define ENC_RES 4
#define ENCA_UP 0x10000
#define ENCA_DOWN (ENCA_UP << 1) 
#define ENCB_UP (ENCA_UP << 2) 
#define ENCB_DOWN (ENCA_UP << 3) 

int8_t enc_state_a = 0;
int8_t enc_count_a = 0;
int8_t enc_state_b = 0;
int8_t enc_count_b = 0;
int8_t enc_states [] = {0, -1, 1, 0, 1, 0, 0, -1, -1, 0, 0, 1, 0, 1, -1, 0};

#define SCROLL_TRESHOLD 8
#define VOLUME_TRESHOLD 16
#define BALL_SCROLL 5
#define BALL_VOLUME 6

int8_t scroll=0;
extern uint8_t current_pseudolayer;

report_mouse_t pointing_device_task_user(report_mouse_t mouse_report) {

    if((current_pseudolayer != BALL_SCROLL) && (current_pseudolayer != BALL_VOLUME)) {
            return mouse_report;     
        }

    //scroll
    if(current_pseudolayer == BALL_SCROLL) {
        if(mouse_report.y < 0) 
            scroll--;
        if(mouse_report.y > 0)
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
        if(mouse_report.y < 0) 
            scroll--;
        if(mouse_report.y > 0)
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

    return mouse_report;
}

bool matrix_scan_custom(matrix_row_t current_matrix[]) {
    bool matrix_has_changed = false;
    uint8_t expander_data = 0;    
    
    for(uint8_t i = 0; i < MATRIX_ROWS; i++) {
        current_matrix[0] = 0;

        //Read keys from B
        expander_data = i2c_read8(I2CB_ADDRESS, GPIOA);        

        if(i2c_last_error()) {
            dprint("Right side connection error!\n");
            i2c_initialize();
            current_matrix[i] |= 0;
        }else {
            current_matrix[i] |= expander_data;
        }
        current_matrix[i] <<= 8;

        //Read encoder from B
        expander_data = i2c_read8(I2CB_ADDRESS, GPIOB);
        expander_data >>= 6;
        enc_count_b <<= 2;
        enc_count_b |= expander_data;
        enc_count_b &= 0xF;
        enc_state_b += enc_states[enc_count_b];
       
        if(i2c_last_error()) {
            dprint("Right side connection error!\n");
            i2c_initialize();
        }
        
        //Read keys from A
        expander_data = i2c_read8(I2CA_ADDRESS, GPIOA);        

        if(i2c_last_error()) {
            dprint("Left side connection error!\n");
            i2c_initialize();
            current_matrix[i] |= 0;
        }else {
            current_matrix[i] |= expander_data;
        }        

        //Read encoder from A
        expander_data = i2c_read8(I2CA_ADDRESS, GPIOB);
        expander_data >>= 6;
        enc_count_a <<= 2;
        enc_count_a |= expander_data;
        enc_count_a &= 0xF;
        enc_state_a += enc_states[enc_count_a];
        
        if (enc_state_b <= -ENC_RES ) {
            current_matrix[i] |= ENCA_DOWN;
            enc_state_b = 0;
        }else {
            current_matrix[i] &= ~ENCA_DOWN;
        }

        if (enc_state_b >= ENC_RES) {
            current_matrix[i] |= ENCA_UP;
            enc_state_b = 0;
        }else {
            current_matrix[i] &= ~ENCA_UP;
        }

        if (enc_state_a <= -ENC_RES ) {
            current_matrix[i] |= ENCB_DOWN;
            enc_state_a = 0;
        }else {
            current_matrix[i] &= ~ENCB_DOWN;
        }

        if (enc_state_a >= ENC_RES) {
            current_matrix[i] |= ENCB_UP;
            enc_state_a = 0;
        }else {
            current_matrix[i] &= ~ENCB_UP;
        }        
    }  

    return matrix_has_changed;
}