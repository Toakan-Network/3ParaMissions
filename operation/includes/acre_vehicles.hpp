class CfgVehicles {
    class ParentVehicle;
    class MyVehicle: ParentVehicle {
        class AcreRacks {
            class Rack_1 {
                displayName = "Dashboard Upper";             // Name displayed in the interaction menu
                shortName = "D.Up";
                componentName = "ACRE_VRC103";        // Able to mount a PRC152
                allowedPositions[] = {"driver", "commander", "gunner"}; // Who can configure the radio and open the radio GUI. Same wildcards as the intercom. It also allows transmitting/receiving
                disabledPositions[] = {};
                defaultComponents[] = {};             // Use this to attach simple components like Antennas. Not yet fully implemented
                mountedRadio = "ACRE_PRC117F";                    // Predefined mounted radio
                isRadioRemovable = 0;                 // Radio can be removed
                intercom[] = {};                      // No access to intercoms. All units in intercom will be able to hear/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface)
            };
            class Rack_2 {
                displayName = "Dashboard Upper";             // Name displayed in the interaction menu
                shortName = "D.Up";
                componentName = "ACRE_VRC103";        // Able to mount a PRC152
                allowedPositions[] = {{"cargo", "all"}};       // Who can configure the radio and open the radio GUI. Same wildcards as the intercom. It also allows transmitting/receiving
                disabledPositions[] = {{"ffv", "all"}};
                defaultComponents[] = {};             // Use this to attach simple components like Antennas. Not yet fully implemented
                mountedRadio = "ACRE_PRC117F";        // Predefined mounted radio
                isRadioRemovable = 1;                 // Radio can be removed
                intercom[] = {};                      // No access to intercoms. All units in intercom will be able to hear/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface)
            };
            class Rack_3 {
                displayName = "Dashboard Lower";             // Name displayed in the interaction menu
                shortName = "D.Low";
                componentName = "ACRE_VRC103";        // Rack type (able to mount a PRC117F)
                allowedPositions[] = {"driver", "commander", "gunner"}; // Who can configure the radio and open the radio GUI. Same wildcards as the intercom. It also allows transmitting/receiving
                disabledPositions[] = {};
                defaultComponents[] = {};
                mountedRadio = "ACRE_PRC117F";        // Predefined mounted radio
                isRadioRemovable = 1;                 // Radio can be removed
                intercom[] = {"intercom_1", "intercom_2"}; // All units in intercom will be able to hear/send transmittions (ACE3 interaction menu) but they cannot manipulate the radio (GUI interface)
            };
        };
    };
};