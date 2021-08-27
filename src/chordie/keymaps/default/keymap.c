#include QMK_KEYBOARD_H

#define _DEFAULT 0

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {\
 [_DEFAULT] = LAYOUT(\
  		                                KC_A,				   KC_X,\
                                      KC_TAB,				 KC_ENT,
                                      KC_B, 				 KC_Z,\
	    KC_1,     KC_2,     KC_3, KC_4,                       KC_F1,      KC_F2,      KC_F3,      KC_F4,\
                                      KC_5,					 KC_F5,\
                                      KC_6, 		     KC_F6,\
                                      KC_7,          KC_F7
)
};

void keyboard_post_init_user(void) {
  // Customise these values to desired behaviour
  //debug_enable=true;
  //debug_matrix=true;
  //debug_keyboard=true;
  //debug_mouse=true;
  println("Post_Init_User()");
}









