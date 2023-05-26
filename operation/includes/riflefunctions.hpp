class RifleRangeFunctions {
	tag = "RR";
	class ACE3Actions {
		file = "scripts\riflerange\functions\actions";
		class addAceActions {};
		class addActions {};
		class clearCondition {};
		class clearHighScoreAction {};
		class connectHeadsetAction {};
		class connectHeadsetCondition {};
		//class disconnectHeadsetAction {};
		class disconnectHeadsetCondition {};
		class drillSelectAction {};
		class muteSpeakerAction {};
		class muteSpeakerCondition {};
		class pauseAction {};
		class pauseCondition {};
		class powerCondition {};
		class powerOffAction {};
		class powerOnAction {};
		class resetAction {};
		class resetCondition {};
		class speakerSettingsCondition {};
		class speakerSettingsMutedCondition {};
		class setDelayAction {};
		class setDelayCondition {};
		class startAction {};
		class startCondition {};
		class stopAction {};
		class stopCondition {};
		class testSpeakerAction {};
		class testSpeakerCondition {};
		class unmuteSpeakerAction {};
		class unmuteSpeakerCondition {};
	};
	class Drills {
		file = "scripts\riflerange\functions\drills";
		class addDrillInstructions {};
		class compileFiringDrills {};
		class runProgram {};
	};
	class Init {
		file = "scripts\riflerange\functions\init";
		class addRangeManual {};
		class initCommon {};
		class initRifleRange {};
	};
	class Misc {
		file = "scripts\riflerange\functions\misc";
		class numberToArray {};
	};
	class Scoreboard {
		file = "scripts\riflerange\functions\scoreboard";
		class addScore {};
		class createSBDigit {};
		class createScoreboard {};
		class numberToTexture {};
		class refreshScores {};
		class setNumberTextures {};
	};
	class Sound {
		file = "scripts\riflerange\functions\sounds";
		class playHeadsetSound {};
		class playMissionSound3D {};
	};
	class Targets {
		file = "scripts\riflerange\functions\target";
		class targetHit {};
	};
};
