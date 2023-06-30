# 3ParaMissions
## Direct commits to this repository require review by J4 Staff. 
## To use this repository.
- Copy the mission file (missions\<missionname>.sqm) to a root directory
- Rename to mission.sqm
- Copy the contents of operation into the root directory of the mission.

## Mission Structure
Structure should look like this.
- Mission_Name.Map_Name
    - mission.sqm (as renamed from mission folder)
    - functions
    - includes
    - scripts
    - sound
    - textures
    - description.ext
    - init files (init.sqf ect.)

## Key considerations

You will need to modify the Description.ext to change the splash art and mission descriptions. ie.

```
onLoadName	= "Pre-Deployment Training";
onLoadMission = "After a long and tiring operation, 3rd Battalion, The Parachute Regiment is gearing up for a new campaign.";
loadScreen = "textures\fenrir.paa";
```
## Creating a new Mission file
Under the mission-settings folder, is an SQF file with all operational settings for ACE, 3CB ect. When the new mission is being setup, this file needs to be imported to the Eden Editor and saved as the new mission.

There is a difference for the Training Server settings, the below needs to be set with values = 999, to disable the survival options.
```
force acex_field_rations_timeWithoutFood = 2;
force acex_field_rations_timeWithoutWater = 2;
```

To Import Settings
- Grab the Settings from /mission-settings/cba_settings-x.ext.
- Rename to cba_settings.sqf
- Put in the Root of the mission file.

## Modlist 
The modlist contains the list of mods which the mission files will all need to be developed using. 
### DO NOT ADD THE QOL MODS WHEN EDITING MISSION FILES


