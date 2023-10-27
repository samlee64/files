/*
Copyright 2020 Swiftrax <swiftrax@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
                                            //
[3] = LAYOUT(
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
                        _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______),
*/

#include QMK_KEYBOARD_H

#define VI_WIN LCTL(KC_W)
#define NAV_TAB_L RGUI(KC_LEFT_CURLY_BRACE)
#define NAV_TAB_R RGUI(KC_RIGHT_CURLY_BRACE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[0] = LAYOUT(
   KC_TAB,      KC_Q,      KC_W,      KC_E,      KC_R,      KC_T,                        KC_Y,      KC_U,      KC_I,      KC_O,      KC_P,   KC_MINUS,
  KC_ESC,       KC_A,      KC_S,      KC_D,      KC_F,      KC_G,                        KC_H,      KC_J,      KC_K,      KC_L,   KC_SCLN,   KC_QUOT,
  KC_LSFT,      KC_Z,      KC_X,      KC_C,      KC_V,      KC_B,                        KC_N,      KC_M,   KC_COMM,    KC_DOT,   KC_SLSH,   KC_RSFT,
                 _______,   KC_BSPC, LT(2, KC_LCTL), KC_LEFT_GUI,                    KC_ENTER, LT(1, KC_SPC), _______,RCTL(KC_S)),
[1] = LAYOUT(
  KC_EQUAL,     KC_1,      KC_2,      KC_3,      KC_4,      KC_5,                        KC_6,      KC_7,      KC_8,      KC_9,      KC_0,   _______,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
  _______,   _______,   _______,   KC_LEFT,  KC_RIGHT,   _______,                     _______,   KC_DOWN,     KC_UP,   _______,   _______,   _______,
                        _______,   _______,     MO(3),   _______,                     _______,   _______,   _______,   _______),

[2] = LAYOUT(
  _______,KC_EXCLAIM,     KC_AT,   KC_HASH, KC_DOLLAR,KC_PERCENT,                     KC_CIRC,   KC_AMPR,   KC_ASTR,   KC_LPRN,   KC_RPRN,  KC_GRAVE,
  _______,   _______,   _______,LCTL(KC_W),   KC_LGUI,LCTL(KC_S),                     _______,KC_LEFT_CURLY_BRACE,KC_RIGHT_CURLY_BRACE,KC_LEFT_BRACKET,KC_RIGHT_BRACKET, KC_BACKSLASH,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
                        _______,   _______,   _______,   _______,                     _______,     MO(3),   _______,   _______),

[3] = LAYOUT(
  _______,   _______,    VI_WIN,   _______,   _______,   _______,                     _______,   _______,   _______,   _______,   _______,   _______,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______, NAV_TAB_L, NAV_TAB_R,   _______,   _______,   _______,
  _______,   _______,   _______,   _______,   _______,   _______,                     _______,   KC_PGDN,   KC_PGUP,   _______,   _______,   _______,
                        _______,   _______,   _______,   _______,                     _______,   _______,   _______,   _______),

};

