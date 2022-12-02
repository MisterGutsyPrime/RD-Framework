/*
onPlayerKilled.sqf
Red Devils 2020
*/

switch (playerSide) do {
	case WEST: { [[west], [east,resistance,civilian]] call ace_spectator_fnc_updateSides;};
	case EAST: { [[east], [west,resistance,civilian]] call ace_spectator_fnc_updateSides;};
	case RESISTANCE: { [[resistance], [east,west,civilian]] call ace_spectator_fnc_updateSides;};
};

//setplayerrespawntime 60;
//player setVariable["Saved_Loadout",getUnitLoadout player];
