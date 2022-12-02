/*
initPlayerLocal.sqf
Red Devils v21
*/

player execVM "\rd_scripts\scripts\loadouts\master\x_rank.sqf";
player setVariable["type","3"]; // Default to: 2nd Pattern Smock
player setVariable["blanco","1"]; // Default to: TRUE

// TOGGLE SMOCK ACE INTERACTION
//Adds option in self interaction to swap Smock+Battledress
//Smock and battledress are swapped, keeping items
_action = ["Toggle Smock","Toggle Smock","",{player execVM "\rd_scripts\scripts\ToggleSmock.sqf"},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

// TOGGLE CHIN STRAP ACE INTERACTION
//Adds option in self interaction to swap Helmet with/without strap
//Helmet with/without strap are swapped, keeping items
_action = ["Toggle Chin Strap","Toggle Chin Strap","",{player execVM "\rd_scripts\scripts\ToggleHelmet.sqf"},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;
/*
//TOGGLE MEDICAL SMOCK ACE INTERACTION (toggle medic armband)
_SquadName = (squadParams player);
_SquadName = _SquadName select 0;
_SquadName = _SquadName select 0;    

switch (_SquadName) do {
    case "16PFA, Red Devils" : {
        _action = ["Toggle Medical Armband","Toggle Medical Armband","",{player execVM "\rd_scripts\scripts\ToggleSmockMedic.sqf"},{true}] call ace_interact_menu_fnc_createAction;
        [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;
    };
};
*/
