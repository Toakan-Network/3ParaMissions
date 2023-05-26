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
player forceAddUniform "lb_16med_basic";
player addVest "mpx_virtus_Medic_p";
player addBackpack "mpx_daysack7";

comment "Add binoculars";
player addWeapon "Binocular";

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
for "_i" from 1 to 2 do {player addItemToUniform "ACE_IR_Strobe_Item";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "kat_Painkiller";
player addItemToVest "ACRE_PRC343";
player addItemToVest "baf_bayonet_compat";
for "_i" from 1 to 2 do {player addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ";};
for "_i" from 1 to 6 do {player addItemToVest "UK3CB_BAF_556_30Rnd";};
for "_i" from 1 to 3 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToVest "UK3CB_BAF_SmokeShell";};
player addItemToBackpack "QAC_BUSHHAT_MTP_CORD_2";
for "_i" from 1 to 4 do {player addItemToBackpack "greenmag_ammo_556x45_basic_30Rnd";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_Canteen";};
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_MRE_BeefStew";};
for "_i" from 1 to 15 do {player addItemToBackpack "kat_guedel";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_tourniquet";};
for "_i" from 1 to 8 do {player addItemToBackpack "ACE_splint";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "3para_beret3_16medd";
player addItemToBackpack "kat_stethoscope";
for "_i" from 1 to 5 do {player addItemToBackpack "kat_TXA";};
for "_i" from 1 to 2 do {player addItemToBackpack "kat_Pulseoximeter";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_nitroglycerin";};
for "_i" from 1 to 10 do {player addItemToBackpack "kat_naloxone";};
for "_i" from 1 to 10 do {player addItemToBackpack "kat_larynx";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_fentanyl";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_IO_FAST";};
for "_i" from 1 to 5 do {player addItemToBackpack "kat_chestSeal";};
player addItemToBackpack "kat_crossPanel";
for "_i" from 1 to 20 do {player addItemToBackpack "kat_IV_16";};
player addItemToBackpack "ACE_surgicalKit";
player addItemToBackpack "ACE_salineIV";
player addItemToBackpack "ACE_plasmaIV";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_plasmaIV_500";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_plasmaIV_250";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_adenosine";};
player addItemToBackpack "kat_accuvac";
player addItemToBackpack "kat_AED";
player addItemToBackpack "USP_PVS14";
for "_i" from 1 to 5 do {player addItemToBackpack "kat_amiodarone";};
for "_i" from 1 to 3 do {player addItemToBackpack "Chemlight_green";};
for "_i" from 1 to 3 do {player addItemToBackpack "UK3CB_BAF_SmokeShellBlue";};
for "_i" from 1 to 3 do {player addItemToBackpack "UK3CB_BAF_SmokeShellPurple";};
for "_i" from 1 to 3 do {player addItemToBackpack "kat_Painkiller";};
player addItemToBackpack "kat_Carbonate";
player addHeadgear "mpx_cobra_scrim";
player addGoggles "UK3CB_BAF_G_Tactical_Clear";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";