/*
onPlayerRespawn.sqf
Red Devils 2020
*/

_handle = player execVM "\rd_scripts\scripts\loadouts\roles\uk_parade.sqf";
waitUntil {scriptDone _handle};


// Give loadout saved with onPlayerKilled/save kit option
//player setUnitLoadout (player getVariable ["Saved_Loadout",[]]);