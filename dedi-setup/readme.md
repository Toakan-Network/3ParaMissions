# Dedicated Box - Server installation
This details the current implementation and setup of the Arma servers on our dedicated box.

## Before running any additional instances.
Make sure you identify which servers are currently running. PROCEXP is installed on the server, if you run it in admin mode, you will be able to determine which instance is running by checking the Commandline Params.

For example:
"C:\Game Servers\Arma 3\3PARA Server\arma3server_x64.exe"  -port=2402 

## Installation directory
- Arma 3 installation directory is: `C:\Game Servers\Arma 3\3PARA Server`
- Mod directory is: `C:\ModStagingDirectory`

Mods are currently installed / managed through `FASTER`. 

## Server Startup Scripts
In the installation directory are a number of autorun, batch scripts. If the Training or Operation server are offline, you can use these to restart them.

- Startup-opserver.bat
- Startup-training.bat

The included modlist will match the running profile for these servers.

There is a headless client script, which will start 1 HC. 
- hc_start_1.bat

### Consideration
The headless client script utilises a different profile space, namely _Profile_hc1.

It is possible to copy / run this for additional HCs, however the script will need to be copied and edited, dependant on requirement.

General rule of thumb, 1 instance of Arma = 2 Cores, be that Server or HC.

## Server Profiles
Server profiles are found under this directory: `C:\Game Servers\Arma 3\3PARA Server\Servers`

- _5f5ae92aca1d4ab9967910338ad5e867 = Training Server
    - Runs on port 2402 
- _675493fd5c4943dc94dd630e74d0ff94 = Operations Server
    - Runs on port 2302


### Other items.
To make the game instance run with more resource availble, the following command switches have been added to the startup params of the server scripts.

- hugepages 
- maxMem=16000 
- malloc=mimalloc_v203_LockPages 
- enableHT 
- bandwidthAlg=2 
- limitFPS=200 
- loadMissionToMemory

## OCAP
The webservice for ocap runs on http://3para.co.uk:5000/.

OCAP is installed to `C:\web`. If the server reboots or requires a restart of the service, you will need to run `ocap-webserver.exe` in this location.
