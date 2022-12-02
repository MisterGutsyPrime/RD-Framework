/*
init.sqf
Red Devils v21
*/
/*
//Set Spawn Loadout
if (hasInterface) then { 
    [] spawn { 
        waitUntil {alive player}; 
        player setVariable ["loadout",getUnitLoadout player,false]; 
        player addEventHandler ["Respawn", { 
            player setUnitLoadout (player getVariable "loadout"); 
        }]; 
    }; 
};
*/

// MISCELLANEOUS
LIB_GLOBAL_ENABLE_RADIO_IN_VEHICLE = false;
enablesaving [false, false];
CHVD_allowNoGrass = false; // DO NOT CHANGE

#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["Red Devils Animations", "rd_anims_salute", "British Salute (HOLD)", {player playActionNow 'kka3_salute'}, {[ace_player, 'GestureNod'] remoteExec ['playActionNow', 0]}, [DIK_N, [false,false,false]]] call CBA_fnc_addKeybind;

// SET RESPAWN POSITION
_position = getPos spawn_1; //This is an object called spawn_1 in mission
createMarker ["respawn_guer", _position];
createMarker ["respawn_west", _position];
createMarker ["respawn_east", _position];

//Use this if you need to move the markers after the start (use in a different script)
//"respawn_guer" setMarkerPos _position;
//"respawn_west" setMarkerPos _position;
//"respawn_east" setMarkerPos _position;

// SET SIDE ALLIANCES
west setFriend [east, 0];
west setFriend [resistance, 0];

east setFriend [west, 0];
east setFriend [resistance, 0];

resistance setFriend [west, 0];
resistance setFriend [east, 0];
    
// LOADOUT BOXES
[ "AmmoboxInit" , [ boxParachute , false ] ] spawn BIS_fnc_arsenal;
[boxParachute,"fow_b_parachute",true] call BIS_fnc_addVirtualBackpackCargo;
	sleep 10;


/*
0 = Generic UK Infantry
0.5 = Rolled Sleeves
1 = UK Smock Base
2 = UK Smock 1st Pattern
2.5 = UK Smock North Africa
3 = UK Smock 2nd Pattern
4 = UK Smock 2nd Pattern Winter
5 = Glider Pilot Regiment
6 = UK Desert Infantry
10 = Canadian Infantry (North Nova Scotia Highlanders)

15 = Generic UK Tanker
16 = UK Tanker 2nd Fife and Fofar Yenmanry 11thAD


20 = FJ Tropical
21 = FJ Winter
22 = FJ Splintertarn
23 = FJ Sumpftarn
24 = FJ Base
25 = PanzerGrenadier 1944 (Winter)
26 = Winter 1941
30 = Heer Base
31 = Heer Camo
35 = Waffen SS Base
40 = DAK Base

50 = USMC 1945 Landing
51 = USMC 1945 Patrol
52 = USMC Tanker

Blanco Tan: 0
Blanco Olive: 1
*/

// Quartermaster Stores

_liststoresArray = [stores,stores_1];
_liststoresExtraArray = [storesExtra,storesExtra_1];


// Stores
{
    _x addAction ["<t color='#A32323'>B Company, General Stores</t>", {}, "", 1.5, true, true, "", "true", 5];
    _x addAction ["Rifleman (No.4 Mk1)", "\rd_scripts\scripts\loadouts\master\k_uk_enfield4.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Rifleman (No.4 Mk1 (T))", "\rd_scripts\scripts\loadouts\master\k_uk_enfield4t.sqf", ["3","1"], 1.5, true, true, "", "true", 5];    
    //_x addAction ["Rifleman (No.1 Mk3*)", "\rd_scripts\scripts\loadouts\master\k_uk_enfield1.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["SMG (Sten Mk5)", "\rd_scripts\scripts\loadouts\master\k_uk_sten5.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["SMG (Sten Mk2)", "\rd_scripts\scripts\loadouts\master\k_uk_sten2.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    //_x addAction ["SMG (Thompson)", "\rd_scripts\scripts\loadouts\master\k_uk_thompson.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Bren Gunner (Bren Mk2)", "\rd_scripts\scripts\loadouts\master\k_uk_bren.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Bren Assistant (No.4 Mk1)", "\rd_scripts\scripts\loadouts\master\k_uk_bren2.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    //_x addAction ["Bren Assistant (No.1 Mk3*)", "\rd_scripts\scripts\loadouts\master\k_uk_bren3.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Nursing Orderly (Sidearm)", "\rd_scripts\scripts\loadouts\master\k_uk_medic.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Boys AT Gunner (Boys AT)", "\rd_scripts\scripts\loadouts\master\k_uk_boysat.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["PIAT Gunner (PIAT)", "\rd_scripts\scripts\loadouts\master\k_uk_piatprimary.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    //_x addAction ["Fighter Pilot", "\rd_scripts\scripts\loadouts\master\k_uk_pilot.sqf", "", 1.5, true, true, "", "true", 5];
    _x addAction ["Bomber Pilot", "\rd_scripts\scripts\loadouts\master\k_uk_pilot2.sqf", "", 1.5, true, true, "", "true", 5];
    _x addAction ["Officer", "\rd_scripts\scripts\loadouts\master\k_uk_officer.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
} forEach _liststoresArray;


// Stores Extra
{
    _x addAction ["<t color='#A32323'>B Company, Additional Stores</t>", {}, "", 1.5, true, true, "", "true", 5];
    _x addAction ["Add EMPTY Backpack (p37)", "\rd_scripts\scripts\loadouts\master\j_backpack_only.sqf", [player,"5","p37"], 1.5, true, true, "", "true", 5];
    //_x addAction ["Add CUP Launcher (6rnd HE)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_cup.sqf", ["5"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add PIAT (Launcher)", "\rd_scripts\scripts\loadouts\master\k_uk_piat.sqf", ["5","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add PIAT Ammo (3rnd)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_piat.sqf", ["5","1"], 1.5, true, true, "", "true", 5]; 
    _x addAction ["Add 2-Inch Mortar (Smoke)", "\rd_scripts\scripts\loadouts\master\k_uk_2inch_smoke.sqf", ["5","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add 2-Inch Mortar (HE)", "\rd_scripts\scripts\loadouts\master\k_uk_2inch_he.sqf", ["5","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add 2-Inch Ammo (6rnd HE)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_2inch_he.sqf", ["5","1"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add 2-Inch Ammo (6rnd Smoke)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_2inch_smoke.sqf", ["5","1"], 1.5, true, true, "", "true", 5];  
    _x addAction ["Add 2-Inch Ammo (6rnd Illumination)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_2inch_illum.sqf", ["5","1"], 1.5, true, true, "", "true", 5];
    //_x addAction ["Add M1919 Tripod", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_m1919_tripod.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    //_x addAction ["Add M1919 Ammo (3x 100rnd)", "\rd_scripts\scripts\loadouts\master\k_uk_ammo_m1919.sqf", ["3"], 1.5, true, true, "", "true", 5];
    _x addAction ["Add Wireless", "\rd_scripts\scripts\loadouts\master\j_backpack_only.sqf", [player,"3","radio"], 1.5, true, true, "", "true", 5];
} forEach _liststoresExtraArray;

//Insertion

    insertion addAction ["<t color='#A32323'>Reinforcement Kit</t>", {}, "", 1.5, true, true, "", "true", 5];
    //insertion addAction ["Rifle (No.1 Mk3*)", "\rd_scripts\scripts\loadouts\master\k_uk_insertion1.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    insertion addAction ["Rifle (No.4 Mk1)", "\rd_scripts\scripts\loadouts\master\k_uk_insertion2.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    //insertion addAction ["SMG (Thompson)", "\rd_scripts\scripts\loadouts\master\k_uk_insertion3.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
    insertion addAction ["SMG (Sten Mk2)", "\rd_scripts\scripts\loadouts\master\k_uk_insertion4.sqf", ["3","1"], 1.5, true, true, "", "true", 5];
	

    boxbe addAction ["<t color='#A32323'>B Coy Equipment Box</t>", {}, "", 1.5, true, true, "", "true", 2];
    box4e addAction ["<t color='#A32323'>No.4 Platoon Equipment Box</t>", {}, "", 1.5, true, true, "", "true", 2];
    box5e addAction ["<t color='#A32323'>No.5 Platoon Equipment Box</t>", {}, "", 1.5, true, true, "", "true", 2];
    box6e addAction ["<t color='#A32323'>No.6 Platoon Equipment Box</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_1 addAction ["<t color='#A32323'>Medical Cannister No.1</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_2 addAction ["<t color='#A32323'>Medical Cannister No.2</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_3 addAction ["<t color='#A32323'>Medical Cannister No.3</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_4 addAction ["<t color='#A32323'>Medical Cannister No.4</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_5 addAction ["<t color='#A32323'>Medical Cannister No.5</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_1 addAction ["<t color='#A32323'>Medical Box No.1</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_2 addAction ["<t color='#A32323'>Medical Box No.2</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_3 addAction ["<t color='#A32323'>Medical Box No.3</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_4 addAction ["<t color='#A32323'>Medical Box No.4</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_5 addAction ["<t color='#A32323'>Medical Box No.5</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_6 addAction ["<t color='#A32323'>Medical Box No.6</t>", {}, "", 1.5, true, true, "", "true", 2];
    boxMedic_7 addAction ["<t color='#A32323'>Medical Box No.7</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_6 addAction ["<t color='#A32323'>Ammunition Cannister No.1</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_7 addAction ["<t color='#A32323'>Ammunition Cannister No.2</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_8 addAction ["<t color='#A32323'>Ammunition Cannister No.3</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_9 addAction ["<t color='#A32323'>Ammunition Cannister No.4</t>", {}, "", 1.5, true, true, "", "true", 2];
    cle_10 addAction ["<t color='#A32323'>Ammunition Cannister No.5</t>", {}, "", 1.5, true, true, "", "true", 2];
    sabox_1 addAction ["<t color='#A32323'>Small Arms Box No.1</t>", {}, "", 1.5, true, true, "", "true", 2];
    sabox_2 addAction ["<t color='#A32323'>Small Arms Box No.2</t>", {}, "", 1.5, true, true, "", "true", 2];
    sabox_3 addAction ["<t color='#A32323'>Small Arms Box No.3</t>", {}, "", 1.5, true, true, "", "true", 2];
    sabox_4 addAction ["<t color='#A32323'>Small Arms Box No.4</t>", {}, "", 1.5, true, true, "", "true", 2];
    sabox_5 addAction ["<t color='#A32323'>Small Arms Box No.5</t>", {}, "", 1.5, true, true, "", "true", 2];
    exbox_1 addAction ["<t color='#A32323'>Explosives Box No.1</t>", {}, "", 1.5, true, true, "", "true", 2];
    exbox_2 addAction ["<t color='#A32323'>Explosives Box No.2</t>", {}, "", 1.5, true, true, "", "true", 2];
    exbox_3 addAction ["<t color='#A32323'>Explosives Box No.3</t>", {}, "", 1.5, true, true, "", "true", 2];
    exbox_4 addAction ["<t color='#A32323'>Explosives Box No.4</t>", {}, "", 1.5, true, true, "", "true", 2];
    exbox_5 addAction ["<t color='#A32323'>Explosives Box No.5</t>", {}, "", 1.5, true, true, "", "true", 2];