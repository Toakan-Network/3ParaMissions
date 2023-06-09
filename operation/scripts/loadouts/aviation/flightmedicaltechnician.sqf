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
player forceAddUniform "raf_tmw_ar";
player addVest "mpx_virtus_Medic";
player addBackpack "mpx_daysack7";

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
for "_i" from 1 to 10 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_quikclot";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_splint";};
for "_i" from 1 to 3 do {player addItemToVest "ACE_tourniquet";};
player addItemToVest "ACRE_PRC343";
player addItemToVest "ACRE_PRC152";
for "_i" from 1 to 3 do {player addItemToVest "ACE_Chemlight_HiBlue";};
for "_i" from 1 to 3 do {player addItemToVest "kat_Painkiller";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellPurple";};
for "_i" from 1 to 2 do {player addItemToVest "MS_Strobe_Mag_1";};
for "_i" from 1 to 2 do {player addItemToVest "MS_Strobe_Mag_2";};
for "_i" from 1 to 5 do {player addItemToVest "UK3CB_BAF_556_30Rnd";};
player addItemToBackpack "USP_PVS15";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_MRE_BeefStew";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_Canteen";};
player addItemToBackpack "UK3CB_BAF_H_Beret_RAF";
player addItemToBackpack "kat_AED";
player addItemToBackpack "ACE_surgicalKit";
player addItemToBackpack "kat_stethoscope";
for "_i" from 1 to 10 do {player addItemToBackpack "kat_IV_16";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_aatKit";};
player addItemToBackpack "kat_accuvac";
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_adenosine";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_amiodarone";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_atropine";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_quikclot";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_splint";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_TXA";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_Pulseoximeter";};
player addItemToBackpack "ACE_salineIV";
player addItemToBackpack "ACE_plasmaIV";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_plasmaIV_500";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_plasmaIV_250";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 20 do {player addItemToBackpack "kat_norepinephrine";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_naloxone";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 10 do {player addItemToBackpack "kat_larynx";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_ketamine";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_IO_FAST";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_EACA";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_chestSeal";};
for "_i" from 1 to 3 do {player addItemToBackpack "kat_Carbonate";};
for "_i" from 1 to 3 do {player addItemToBackpack "kat_Painkiller";};
player addHeadgear "lb_hgu_med";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";