#include "script_component.hpp"

if (!hasInterface) exitWith {};

["SettingsInitialized", {
    // if not enabled, then bugger off.
    if !(GVAR(enabled)) exitWith {};

    // Force the view distance down to the limit.
    if (viewDistance > GVAR(limitViewDistance)) then {
        setViewDistance GVAR(limitViewDistance);
    };

    // Adapt view distance when the player is created or changed according to whether client is on foot or vehicle.
    ["playerChanged",{
        [false] call FUNC(adaptViewDistance);
    }] call EFUNC(common,addEventHandler);

    // Set the EH which waits for any of the view distance settings to be changed, so that the effect is show immediately
    ["SettingChanged",{
        params ["_name"];
        if ((_name  == QGVAR(viewDistanceOnFoot)) ||
            (_name  == QGVAR(viewDistanceLandVehicle)) ||
            (_name  == QGVAR(viewDistanceAirVehicle)) ||
            (_name  == QGVAR(objectViewDistanceCoeff))) then {

            [true] call FUNC(adaptViewDistance);
        };
    }] call EFUNC(common,addEventHandler);

    // Set the EH which waits for a vehicle change to automatically swap between On Foot/In Land Vehicle/In Air Vehicle
    ["playerVehicleChanged",{
        [false] call FUNC(adaptViewDistance)
    }] call EFUNC(common,addEventHandler);
}] call EFUNC(common,addEventHandler);
