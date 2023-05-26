# 3ParaMissions
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

# Direct commits to this repository require review by J4 Staff. 