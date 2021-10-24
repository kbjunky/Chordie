
#ifndef CONFIG_H
#define CONFIG_H

#include "config_common.h"

/* USB Device descriptor parameter */

#define VENDOR_ID       0xBEEF
#define PRODUCT_ID      0x6511
#define DEVICE_VER      0x0001
#define MANUFACTURER    KBJ
#define PRODUCT         KBJ Chordie
#define DESCRIPTION     Come in Chordie they all chord in here

/* key matrix size */
#define MATRIX_ROWS 1
#define MATRIX_COLS 20

/* COL2ROW or ROW2COL */
#define DIODE_DIRECTION COL2ROW

/* Set 0 if debouncing isn't needed */
#define DEBOUNCE 5

/* Mechanical locking support. Use KC_LCAP, KC_LNUM or KC_LSCR instead in keymap */
#define LOCKING_SUPPORT_ENABLE
/* Locking resynchronize hack */
#define LOCKING_RESYNC_ENABLE

/*
 * Feature disable options
 *  These options are also useful to firmware size reduction.
 */

/* disable debug print */
//#define NO_DEBUG

/* disable print */
//#define NO_PRINT

/* disable action features */
#define NO_ACTION_LAYER
#define NO_ACTION_TAPPING
#define NO_ACTION_ONESHOT
#define NO_ACTION_MACRO
#define NO_ACTION_FUNCTION

#endif
