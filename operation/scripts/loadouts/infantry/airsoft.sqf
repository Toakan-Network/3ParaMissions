comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "UK3CB_BAF_L85A3_Grippod_D";
player addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
player addPrimaryWeaponItem "RKSL_optic_LDS_PiP";
player addPrimaryWeaponItem "training_stanag_30rnd_rubber_brityellow";
player addPrimaryWeaponItem "UK3CB_underbarrel_acc_grippod_d";

comment "Add containers";
player forceAddUniform "lb_3para_basic";
player addVest "mpx_virtus_p";

comment "Add binoculars";
player addWeapon "Binocular";

comment "Add items to containers";
player addItemToUniform "BW_Facepaint";
player addItemToBackpack "ACE_EntrenchingTool";
player addItemToVest "ACRE_PRC343";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_IR_Strobe_Item";};
for "_i" from 1 to 10 do {player addItemToVest "training_pmag_30rnd_rubber_yellow";};

player addItemToBackpack "USP_PVS14";
for "_i" from 1 to 3 do {player addItemToBackpack "Chemlight_green";};
player addHeadgear "mpx_cobra_scrim";
player addGoggles "UK3CB_BAF_G_Tactical_Clear";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";