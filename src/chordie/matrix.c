#include <stdint.h>
#include <stdbool.h>
#include "wait.h"
#include "print.h"
#include "debug.h"
#include "util.h"
#include "matrix.h"
#include "debounce.h"
#include "quantum.h"

#include QMK_KEYBOARD_H

#if (MATRIX_COLS <= 8)
#    define print_matrix_header() print("\nr/c 01234567\n")
#    define print_matrix_row(row) print_bin_reverse8(matrix_get_row(row))
#    define matrix_bitpop(i) bitpop(matrix[i])
#    define ROW_SHIFTER ((uint8_t)1)
#elif (MATRIX_COLS <= 16)
#    define print_matrix_header() print("\nr/c 0123456789ABCDEF\n")
#    define print_matrix_row(row) print_bin_reverse16(matrix_get_row(row))
#    define matrix_bitpop(i) bitpop16(matrix[i])
#    define ROW_SHIFTER ((uint16_t)1)
#elif (MATRIX_COLS <= 32)
#    define print_matrix_header() print("\nr/c 0123456789ABCDEF0123456789ABCDEF\n")
#    define print_matrix_row(row) print_bin_reverse32(matrix_get_row(row))
#    define matrix_bitpop(i) bitpop32(matrix[i])
#    define ROW_SHIFTER ((uint32_t)1)
#endif

#ifdef MATRIX_MASKED
extern const matrix_row_t matrix_mask[];
#endif

/* matrix state(1:on, 0:off) */
static matrix_row_t raw_matrix[MATRIX_ROWS];  // raw values
static matrix_row_t matrix[MATRIX_ROWS];      // debounced values

//__attribute__((weak)) void matrix_init_quantum(void) { matrix_init_kb(); }
//__attribute__((weak)) void matrix_scan_quantum(void) { matrix_scan_kb(); }
__attribute__((weak)) void matrix_init_kb(void) { matrix_init_user(); }
__attribute__((weak)) void matrix_scan_kb(void) { matrix_scan_user(); }
__attribute__((weak)) void matrix_init_user(void) {}
__attribute__((weak)) void matrix_scan_user(void) {}
//__attribute__((weak)) void matrix_init_kb(void) {}

inline uint8_t matrix_rows(void) { return MATRIX_ROWS; }
inline uint8_t matrix_cols(void) { return MATRIX_COLS; }

#define ENC_RES 4
#define ENC_UP ((uint32_t) 1 )
#define ENC_DOWN (ENC_UP << 1) 
#define IR_STATE 0x10

int8_t enc_state = 0;
int8_t enc_count = 0;
int8_t enc_states [] = {0, -1, 1, 0, 1, 0, 0, -1, -1, 0, 0, 1, 0, 1, -1, 0};

/* HERE STARTS IMPLEMENTATION OF CUSTOM MATRIX HANDLING */
matrix_row_t matrix_get_row(uint8_t row) {
    // TODO: return the requested row data
    return matrix[row];
}

void matrix_power_up() {
    print("matrix.c->matrix_power_up()");
}

void matrix_power_down() {
    print("matrix.c->matrix_power_down()");
}

void matrix_print(void) {
    print_matrix_header();

    for (uint8_t row = 0; row < MATRIX_ROWS; row++) {
        print_hex8(row);
        print(": ");
        print_matrix_row(row);
        print("\n");
    }
}

void matrix_init(void) {
    // TODO: initialize hardware and global matrix state here
    i2c_initialize();
    for(uint8_t i = 0; i < MATRIX_ROWS; i++) {
        raw_matrix[i] = 0;
        matrix[i] = 0;
    }
   
    // Unless hardware debouncing - Init the configured debounce routine
    debounce_init(MATRIX_ROWS);

    // This *must* be called for correct keyboard behavior
    matrix_init_user();
}



uint8_t matrix_scan(void) {
    bool changed = false;
    uint8_t expander_data = 0;
    matrix_row_t current_row = 0;
    
    for(uint8_t i = 0; i < MATRIX_ROWS; i++) {
        //Read keys from L
        expander_data = i2c_read8(I2CL_ADDRESS, GPIOA);  

        if(i2c_last_error()) {
            dprint("Right side connection error!\n");
            i2c_initialize();
            current_row |= 0;
        }else {
            current_row |= expander_data;
        }
        current_row <<= 1;

        //Read bank B from L      
        expander_data = i2c_read8(I2CL_ADDRESS, GPIOB);

        if(i2c_last_error()) {
            dprint("Left side connection error!\n");
            i2c_initialize();
        }
        
        //extract encoder switch state 
        if(expander_data & 0x80)   
            current_row |= 1;        
        current_row <<= 1;

        //extract LIR state 
        if(expander_data & IR_STATE) {
            current_row |= 1;         
        
        }

        current_row <<= 8;
        
        //extract encoder A/B state
        expander_data &= 0x60;        
        expander_data >>= 5;        
        enc_count <<= 2;
        enc_count |= expander_data;
        enc_count &= 0xF;        
        enc_state += enc_states[enc_count];       
        
        //Read keys from R
        expander_data = i2c_read8(I2CR_ADDRESS, GPIOA);        
        if(i2c_last_error()) {
            dprint("Right side connection error!\n");
            i2c_initialize();
            current_row |= 0;
        }else {
            current_row |= expander_data;
        }
       
        //Read encoder from R       
        expander_data = i2c_read8(I2CR_ADDRESS, GPIOB);  

        if(i2c_last_error()) {
            dprint("Right side connection error!\n");
            i2c_initialize();
        } 
     
        //extract RIR from R
        current_row <<= 1;
        if(expander_data & IR_STATE)
            current_row |= 1;              

        current_row <<= 2;

        if(current_row != raw_matrix[i]) {
            raw_matrix[i] = current_row;
            changed = true;
        } 
        current_row = 0;
    }    

    debounce(raw_matrix, matrix, MATRIX_ROWS, changed);
    
    if (enc_state <= -ENC_RES ) {
        matrix[0] |= ENC_DOWN;
        enc_state = 0;
    }else {
        matrix[0] &= ~ENC_DOWN;
    }

    if (enc_state >= ENC_RES) {
        matrix[0] |= ENC_UP;
        enc_state = 0;
    }else {
        matrix[0] &= ~ENC_UP;
    }        


    matrix_scan_user();
    
    return changed;
}