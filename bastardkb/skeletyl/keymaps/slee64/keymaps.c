/*
 * Copyright 2021 Quentin LEBASTARD <qlebastard@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


#include QMK_KEYBOARD_H

#define VI_WIN LCTL(KC_W)
#define NAV_TAB_L RGUI(KC_LEFT_CURLY_BRACE)
#define NAV_TAB_R RGUI(KC_RIGHT_CURLY_BRACE)

enum custom_keycodes {
  TMUX_H = SAFE_RANGE,
  TMUX_J,
  TMUX_K,
  TMUX_L,
  TMUX_CP,
  TMUX_Z,
  TMUX_RPRN,
  TMUX_LPRN
};


bool process_record_user(uint16_t keycode, keyrecord_t* record) {
  switch (keycode) {
    case TMUX_H:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"h");
      }
      return false;

    case TMUX_J:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"j");
      }
      return false;
    case TMUX_K:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"k");
      }
      return false;
    case TMUX_L:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"l");
      }
      return false;
    case TMUX_CP:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"[");
      }
      return false;
    case TMUX_Z:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"z");
      }
      return false;
    case TMUX_LPRN:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")"(");
      }
      return false;
    case TMUX_RPRN:  // Types ../ to go up a directory on the shell.
      if (record->event.pressed) {
                SEND_STRING(SS_LCTL("s")")");
      }
      return false;
  }
  return true;
}

bool favor_hold(uint16_t keycode) {
    switch (keycode) {
        case  MT(MOD_RSFT, KC_ESC):
            return true;
        default:
            return false;
    }
}

// ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
// │ C U S T O M  C O N F I G                                                                                                                   │
// └────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
// ▝▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▘
uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    return favor_hold(keycode) ? TAPPING_TERM : TAPPING_TERM + 1500;
}

bool get_hold_on_other_key_press(uint16_t keycode, keyrecord_t *record) {
    return favor_hold(keycode);
}

bool get_permissive_hold(uint16_t keycode, keyrecord_t *record) {
    return favor_hold(keycode);
}


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [0] = LAYOUT_split_3x5_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                        KC_Y,    KC_U,    KC_I,    KC_O,   KC_P,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
       KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                        KC_H,    KC_J,    KC_K,    KC_L, KC_SCLN,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_Z,    KC_X, MT(MOD_LGUI, KC_C),   KC_V,    KC_B,                         KC_N,    KC_M, MT(MOD_RGUI, KC_COMM),  KC_DOT, KC_SLSH,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                             KC_BSPC, LT(2, KC_LCTL),  KC_LEFT_GUI,     KC_ENTER, LT(1, KC_SPC), MT(MOD_RSFT, KC_ESC)
                                      //`--------------------------'  `--------------------------'

  ),

  [1] = LAYOUT_split_3x5_3(
  //,-----------------------------------------------------.             ,-----------------------------------------------------.
      KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_6,    KC_7,    KC_8,    KC_9,    KC_0,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_TAB, KC_EQUAL,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, KC_LEFT,KC_RIGHT, XXXXXXX,                      XXXXXXX, KC_DOWN,   KC_UP, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, MO(3),  _______,   _______, _______, _______
                                      //`--------------------------'  `--------------------------'
  ),

  [2] = LAYOUT_split_3x5_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      KC_EXLM,   KC_AT, KC_HASH,  KC_DLR, KC_PERC,                      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_COLON, XXXXXXX, XXXXXXX, KC_GRAVE, XXXXXXX,                     KC_MINS, KC_LCBR, KC_RCBR, KC_QUOT, KC_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_UNDS, KC_LBRC, KC_RBRC, KC_BSLS, KC_PIPE,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                       _______,  _______, _______,    _______, MO(3), KC_DOUBLE_QUOTE
                                      //`--------------------------'  `--------------------------'
  ),

  [3] = LAYOUT_split_3x5_3(
  //|---------+---------+---------+---------+---------+--------|        |---------+---------+---------+---------+---------+--------|
        KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,                  _______,  _______,  _______,  TMUX_LPRN,  TMUX_RPRN,
  //|---------+---------+---------+---------+---------+--------|        |---------+---------+---------+---------+---------+--------|
      _______,   LSFT(KC_TAB), KC_LGUI,LGUI(KC_MINUS),LGUI(KC_PLUS),    XXXXXXX,NAV_TAB_L,NAV_TAB_R,    XXXXXXX,    XXXXXXX,
  //|---------+---------+---------+---------+---------+--------|        |---------+---------+---------+---------+---------+--------|
      _______,   TMUX_Z,  _______,  _______,  _______,                  XXXXXXX, KC_PGDN, KC_PGUP, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______,  _______, _______, _______,  _______, _______
                                      //`--------------------------'  `--------------------------'
  )
};
