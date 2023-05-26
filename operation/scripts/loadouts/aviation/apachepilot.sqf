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
player addWeapon "UK3CB_BAF_L22A2";
player addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Tan";
player addPrimaryWeaponItem "RKSL_optic_EOT552";
player addPrimaryWeaponItem "UK3CB_BAF_556_30Rnd";

comment "Add containers";
player forceAddUniform "aac_663sqn_2lt";
player addVest "UK3CB_BAF_V_Pilot_A";
player addBackpack "mpx_daysack8";

comment "Add binoculars";
player addWeapon "Binocular";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addItemToVest "ACE_Flashlight_XL50";
player addItemToVest "ACE_MapTools";
player addItemToVest "KNB_Notebook";
for "_i" from 1 to 2 do {player addItemToVest "ACE_EarPlugs";};
player addItemToVest "greenmag_item_speedloader";
player addItemToVest "KNB_PanelRed";
for "_i" from 1 to 2 do {player addItemToVest "ACE_IR_Strobe_Item";};
player addItemToVest "ItemcTabHCam";
player addItemToVest "ItemAndroid";
for "_i" from 1 to 5 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_quikclot";};
for "_i" from 1 to 2 do {player addItemToVest "kat_chestSeal";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 3 do {player addItemToVest "kat_guedel";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_splint";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_tourniquet";};
player addItemToVest "ACRE_PRC343";
for "_i" from 1 to 3 do {player addItemToVest "ACE_Chemlight_IR";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_Chemlight_HiBlue";};
for "_i" from 1 to 3 do {player addItemToVest "kat_Painkiller";};
for "_i" from 1 to 5 do {player addItemToVest "UK3CB_BAF_556_30Rnd";};
player addItemToBackpack "USP_PVS15";
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_MRE_BeefStew";};
for "_i" from 1 to 3 do {player addItemToBackpack "ACE_Canteen";};
player addItemToBackpack "ACRE_PRC117F";
player addItemToBackpack "3para_beret1_aac";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_HandFlare_Red";};
for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShellPurple";};
for "_i" from 1 to 2 do {player addItemToBackpack "MS_Strobe_Mag_1";};
for "_i" from 1 to 2 do {player addItemToBackpack "MS_Strobe_Mag_2";};
player addHeadgear "lb_hgu_apache_v";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";