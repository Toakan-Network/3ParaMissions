// File only to be modified with review and confirmation by J4 Head & J1 Heads of office.
InA_Server_coreStaffUIDs = [ 
 "76561197991835568"  // Tad 
  //,"76561198263317224"  // Minstreal 
  ]; 
InA_Server_staffUIDs = [
    "76561198191807158",  // Andy 
    "76561198286815321",   // Spink
    "76561198150743373",   // Jammin
    "76561198139168151"     // Bjorn
]; 

Zeus_IDs = [
  "76561198353138828", // Aels
  "76561198897982744" // Alyx
];

InA_Server_TrainingUIDs = [ 
 "76561198214736719",  // Taze 
 "76561198139168151",  // Bjorn
 "76561198077199744",  // Godfrey 
 "76561198039016143",  // Stapple 
 "76561198121356858",  // AS1. Scott 
 "76561199134599470", // Ralph 
 "76561198084609105", // Marshall 
 "76561197997965643", // Worgan 
 "76561198116938693",  // Jones 
 "76561198320863733"  // Burton 
]; 

GCam_Users = [ 
 //"76561198263317224",  // Minstreal 
  "76561198101811684",  // Braid 
  "76561198214736719",  // Taze
  "76561198353138828",  // Aelswyph
  "76561198122454585",  // Flint
  "76561198397364867",  // Forbes
  "76561198897982744"   // Alyx
 ]; 
 
ServerAdmins = InA_Server_coreStaffUIDs + InA_Server_staffUIDs; 
Trainers = ServerAdmins + InA_Server_TrainingUIDs;

// We set the variables here, so they can't be modified in flight and the server always has the true information.
// Yes this requires a server restart to push entries to the server array's but oh well.
publicvariable "ServerAdmins";
publicVariable "Trainers";
publicVariable "GCam_Users";
PublicVariable "Zeus_IDs";

ServerAdmins;