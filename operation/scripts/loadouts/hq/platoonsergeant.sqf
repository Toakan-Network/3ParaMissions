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
player addWeapon "UK3CB_BAF_L85A3";
player addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
player addPrimaryWeaponItem "RKSL_optic_LDS_PiP";
player addPrimaryWeaponItem "UK3CB_BAF_556_30Rnd";
player addPrimaryWeaponItem "UK3CB_underbarrel_acc_grippod_d";
player addWeapon "rhsusf_weap_glock17g4";
player addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

comment "Add containers";
player forceAddUniform "lb_3para_basic";
player addVest "mpx_virtus_taco2_p";
player addBackpack "mpx_daysack9";

comment "Add binoculars";
player addMagazine "Laserbatteries";
player addWeapon "UK3CB_BAF_Soflam_Laserdesignator";

comment "Add items to containers";
player addItemToUniform "KNB_Notebook";
player addItemToUniform "BW_Facepaint";
for "_i" from 1 to 3 do {player addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
player addItemToUniform "greenmag_item_speedloader";
for "_i" from 1 to 2 do {player addItemToUniform "kat_chestSeal";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_Clacker";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "kat_Painkiller";
player addItemToVest "baf_bayonet_compat";
player addItemToVest "ACRE_PRC343";
player addItemToVest "ACRE_PRC152";
for "_i" from 1 to 6 do {player addItemToVest "UK3CB_BAF_556_30Rnd";};
for "_i" from 1 to 3 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToVest "UK3CB_BAF_SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_JHP";};
player addItemToBackpack "3para_beret3_parad";
player addItemToBackpack "QAC_BUSHHAT_MTP_CORD_2";
for "_i" from 1 to 26 do {player addItemToBackpack "greenmag_ammo_556x45_basic_30Rnd";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_Canteen";};
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_MRE_BeefStew";};
for "_i" from 1 to 3 do {player addItemToBackpack "kat_guedel";};
player addItemToBackpack "kat_chestSeal";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_splint";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "USP_PVS14";
player addItemToBackpack "UK3CB_BAF_Kite";
player addItemToBackpack "ItemAndroid";
player addItemToBackpack "ItemcTabHCam";
player addItemToBackpack "KNB_PanelRed";
player addItemToBackpack "sps_black_hornet_01_Static_F";
for "_i" from 1 to 5 do {player addItemToBackpack "greenmag_ammo_762x51_basic_30Rnd";};
for "_i" from 1 to 3 do {player addItemToBackpack "greenmag_beltlinked_762x51_basic_100";};
player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
player addItemToBackpack "UK3CB_BAF_762_100Rnd_T";
for "_i" from 1 to 3 do {player addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 3 do {player addItemToBackpack "UK3CB_BAF_SmokeShellBlue";};
for "_i" from 1 to 3 do {player addItemToBackpack "UK3CB_BAF_SmokeShellPurple";};
player addHeadgear "mpx_cobra_scrim";
player addGoggles "UK3CB_BAF_G_Tactical_Clear";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "B_UavTerminal";