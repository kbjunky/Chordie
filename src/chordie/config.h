
#ifndef CONFIG_H
#define CONFIG_H

#define PMW33XX_CS_PIN 0xF7
#define PMW33XX_CPI 900
#define POINTING_DEVICE_ROTATION_270
#define POINTING_DEVICE_INVERT_X
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

#endif
