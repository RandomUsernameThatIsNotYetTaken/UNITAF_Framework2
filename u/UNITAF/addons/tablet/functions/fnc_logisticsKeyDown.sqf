#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles keyboard input for the inventory display.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Key Code <NUMBER>
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * [DISPLAY, 0] call zen_inventory_fnc_keyDown
 *
 * Public: No
 */

params ["_display", "_keyCode"];

// Exit if the items list is not in focus
if !(_display getVariable [QGVAR(listFocused), false]) exitWith {false};

switch (_keyCode) do {
    case DIK_LEFT;
    case DIK_NUMPADMINUS: {
        [_display, false] call FUNC(logisticsModify);
        true
    };
    case DIK_RIGHT;
    case DIK_NUMPADPLUS: {
        [_display, true] call FUNC(logisticsModify);
        true
    };
    default {false};
};