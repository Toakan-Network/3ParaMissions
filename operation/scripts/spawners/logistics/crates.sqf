// All-in-one logistic spawner.
params ["_target", "_caller", "_actionId", "_arguments"];
_boxName = _this param [3,"",[""]];
[2, format ["Logistics spawning box: %1, requested by: %2", _boxName, _caller]] execvm "scripts\performance\log.sqf";

// Setup script variables.
private _map = worldName;
private _posA = [];
private _spawnVhc = "";
private _boxType = "";
private _contents = [];

// Logistic location.
switch (_map) do
{
	case "rof_mok": {
		_posA = [[9882.280,19580.297,0], 0, 5, 5] call BIS_fnc_findSafePos;
	};
	
	case "Napf":{
		_posA = [[15088.358,16471.05,0], 0, 7, 5] call BIS_fnc_findSafePos;
	};

	default {false};
};

// Box contents, and type.
switch _boxName do
{
	case "alpha": {
		_boxType = "UK3CB_BAF_Box_556_Ammo";
		_contents pushback ["greenmag_ammo_556x45_basic_30Rnd", 40];
		
	};

	case "bravo": {
		_boxType = "UK3CB_BAF_Box_762_Ammo";
		_contents pushback ["greenmag_ammo_762x54_basic_30Rnd", 40];
	};

	case "charlie": {
		_boxType = "UK3CB_BAF_Box_762_Ammo";
		_contents pushback ["UK3CB_BAF_762_100Rnd", 20];
		_contents pushback ["UK3CB_BAF_762_800Rnd", 5];
	};

	case "delta": {
		_boxType = "UK3CB_BAF_Box_Milan_Ammo";
		_contents pushback ["launch_NLAW_F", 4];
	};

	case "echo": {
		_boxType = "UK3CB_BAF_Box_Milan_Ammo";
		_contents pushback ["RW_Launch_ASM_AS_Loaded", 4];
	};

	case "foxtrot": {
		_boxType = "UK3CB_BAF_Box_Milan_Ammo";
		_contents pushback ["RW_Launch_ASM_HESH_Loaded", 4];
	};

	case "golf": {
		_boxType = "UK3CB_BAF_Box_Grenade";
		_contents pushback ["rhs_mag_m67", 15];
		_contents pushback ["SmokeShell", 15];
		_contents pushback ["SmokeShellPurple", 10];
		_contents pushback ["SmokeShellBlue", 10];
		_contents pushback ["rhs_mag_m18_red", 5];
	};

	case "hotel": {
		_boxType = "UK3CB_BAF_Box_40_Ammo";
		_contents pushback ["UK3CB_BAF_1Rnd_HE_Grenade_Shell", 30];
		_contents pushback ["UK3CB_BAF_1Rnd_SmokeRed_Grenade_shell", 10];
		_contents pushback ["UK3CB_BAF_1Rnd_Smoke_Grenade_shell", 10];
		_contents pushback ["UK3CB_BAF_1Rnd_SmokeBlue_Grenade_shell", 10];
	};

	case "india": {
		_boxType = "UK3CB_BAF_Box_Milan_Ammo";
		_contents pushback ["UK3CB_BAF_Javelin_CLU", 2];
		_contents pushback ["UK3CB_BAF_Javelin_Slung_Tube", 4];
	};

	case "juliet": {
		_boxType = "ACE_medicalSupplyCrate";
		_contents pushback ["ACE_fieldDressing", 30];
		_contents pushback ["ACE_elasticBandage", 30];
		_contents pushback ["ACE_packingBandage", 30];
		_contents pushback ["ACE_quikclot", 20];
		_contents pushback ["ACE_epinephrine", 15];
		_contents pushback ["ACE_morphine", 15];
		_contents pushback ["kat_chestSeal", 20];
		_contents pushback ["kat_ncdKit", 10];
		_contents pushback ["ACE_splint", 20];
		_contents pushback ["kat_IO_FAST", 10];
		_contents pushback ["kat_guedel", 20];
	};

	case "kilo": {
		_boxType = "ACE_medicalSupplyCrate_advanced";
		_contents pushback ["ACE_fieldDressing", 30];
		_contents pushback ["ACE_elasticBandage", 30];
		_contents pushback ["ACE_packingBandage", 30];
		_contents pushback ["ACE_quikclot", 20];
		_contents pushback ["ACE_epinephrine", 15];
		_contents pushback ["ACE_morphine", 15];
		_contents pushback ["kat_chestSeal", 20];
		_contents pushback ["kat_ncdKit", 10];
		_contents pushback ["ACE_splint", 20];
		_contents pushback ["kat_IO_FAST", 10];
		_contents pushback ["kat_guedel", 20];

		// Advanced Med Stuff
		_contents pushback ["kat_larynx", 30];
		_contents pushback ["kat_TXA", 30];
		_contents pushback ["kat_Pulseoximeter", 10];
		_contents pushback ["kat_nitroglycerin", 20];
		_contents pushback ["kat_naloxone", 20];
		_contents pushback ["kat_fentanyl", 20];
		_contents pushback ["kat_IV_16", 40];
		_contents pushback ["ACE_plasmaIV_500", 10];
		_contents pushback ["ACE_salineIV_500", 10];
		_contents pushback ["ACE_salineIV_250", 20];
		_contents pushback ["ACE_plasmaIV_250", 20];
		_contents pushback ["ACE_adenosine", 20];
		_contents pushback ["kat_amiodarone", 20];
		_contents pushback ["kat_Painkiller", 20];
		_contents pushback ["kat_stethoscope", 5];
		_contents pushback ["kat_accuvac", 5];
		_contents pushback ["kat_AED", 2];
		_contents pushback ["ACE_surgicalKit", 5];

		// Oxygen
		_contents pushback ["kat_BVM", 20];
		_contents pushback ["kat_oxygenTank_150_Item", 10];
		_contents pushback ["kat_oxygenTank_300_Item", 3];
	};

	case "lima": {
		_boxType = "UK3CB_BAF_Box_L16_Ammo_HE";
		_contents pushback ["UK3CB_BAF_1Rnd_81mm_Mo_Shells", 20, 20]; 
	};

	case "mike": {
		_boxType = "UK3CB_BAF_Box_L16_Ammo_HE";
		_contents pushback ["UK3CB_BAF_1Rnd_81mm_Mo_Flare_White", 20, 20]; 
	};

	case "november": {
		_boxType = "UK3CB_BAF_Box_L16_Ammo_HE";
		_contents pushback ["UK3CB_BAF_1Rnd_81mm_Mo_Smoke_White", 20, 20];
	};

	default {
		_boxType = "UK3CB_BAF_Box_Milan_Ammo";
		_contents pushback ["launch_NLAW_F", 4];
	};

};

// Box spawn & cleanup.
// Setup box
_spawnVhc = createVehicle [_boxType, _posA,[],0,"NONE"];
_spawnVhc setDir 0;
_spawnVhc enableDynamicSimulation true;

// Quick cleanup.
clearItemCargoGlobal _spawnVhc;
clearMagazineCargoGlobal _spawnVhc;
clearWeaponCargoGlobal _spawnVhc;

// Mortars use MagAmmo which is annoying.
// We use a built array for the weird object lists, define them here.
private _altBoxes = ["lima", "mike", "november"];

// Now we add the items based on the array size.
switch true do {

	case (_boxName in _altboxes): {
		{
			private _item = _x select 0;
			private _amount = _x select 1;
			private _a = _x select 2;
			_spawnVhc addMagazineAmmoCargo  [_item, _amount, _a]; 
		} foreach _contents;
	};

	default {
		// Add items
		{
			private _item = _x select 0;
			private _amount = _x select 1;
			_spawnVhc addItemCargoGlobal [_item, _amount];
		} foreach _contents;

	};
};
