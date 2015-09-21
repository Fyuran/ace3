/*
 * Author: commy2
 * Returns all hitpoints and their respective selections of any vehicle. Might contain duplicates for non unique hitpoints in turrets.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Hitpoints <ARRAY>
 * 1: Selections <ARRAY>
 *
 * Public: Yes
 *
 * Deprecated
 */
#include "script_component.hpp"

ACE_WARNINGFORMAT_3("%1 is deprecated. Support will be dropped in version %2. Replaced by: %3","ace_common_fnc_getHitPointsWithSelections","3.5.0","getAllHitPointsDamage");

params ["_vehicle"];

private "_hitPointsWithSelections";
_hitPointsWithSelections = getAllHitPointsDamage _vehicle;

_hitPointsWithSelections resize 2;

_hitPointsWithSelections
