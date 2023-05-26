_spawner = _this select 0;
_spawner addaction ["Spawn Wildcat", {execVM 'scripts\spawners\aviation\deployWildcat.sqf'}];
_spawner addaction ["Spawn Chinook", {execVM 'scripts\spawners\aviation\deployChinook.sqf'}];
_spawner addaction ["Spawn Puma", {execVM 'scripts\spawners\aviation\deployPuma.sqf'}];
_spawner addaction ["Spawn AH64", {execVM 'scripts\spawners\aviation\deployAH.sqf'}];
_spawner addaction ["Spawn F35A", {execVM 'scripts\spawners\aviation\deployJet.sqf'}];
_spawner addaction ["Spawn F35A Stealth", {execVM 'scripts\spawners\aviation\deployJetStealth.sqf'}];
_spawner addaction ["Spawn A400M", {execVM 'scripts\spawners\aviation\deployA400.sqf'}];