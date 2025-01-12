///Sets configurable global options

//Debug
global.debugMode = true;        //Enables debug keys (check objWorld step to see all of them), make sure to set this to "false" before releasing your game
global.debugVisuals = false;     //Enables changing the color/alpha of player when infjump/god mode are toggled, make sure to disable this if you want to change the player's image_alpha or image_blend
global.debugControl = false;    //Sets whether to require control to be held for certain debug options (used to prevent accidental usage of debug binds with things such as numpadding, or fat fingering)
global.debugDeathSpeed = 50;    //Sets how many frames after getting hit for god mode to effect the player (50 frames = 1 second, 1 frame = chainsaw mode)

//Updates
global.checkForUpdates = true;
global.versionDataUrl = "https://raw.githubusercontent.com/TheMagicFlute/sI-Wanna-See-The-Moon-Remake/refs/heads/main/IWSTMR-current-version.json";
global.gameVersion = "1.2.04";

//Menu
global.menuMode = 0;                //Sets whether to use a warp room or a menu for selecting the game's difficulty (0 = warp room, 1 = menu)
global.menuSound = sndJump;         //Sets what sound to use for navigating the main menu

//World
global.startRoom = rDiffSelect;         //Sets which room to begin with
// global.startRoom = rForest;         // For Test
global.roomCaptionDef = "I Wanna See The Moon Remake";  //Sets default window caption (only works with the Professional version of Studio)
global.deathMusicMode = 1;          //Sets whether or not to play death music when the player dies (0 = no death music, 1 = instantly pause current music, 2 = fade out current music)
global.pauseDelayLength = 40;       //Sets the delay in frames in which the player can pause/unpause the game (can be set to 0 to disable pause delay)
global.timeWhenDead = true;         //Sets whether or not to count the in-game timer when the player is dead
global.timeWhenCleared = false;     //Increment the timer after the save file is considered finished
global.platformsPhase = false;      //Sets whether or not to let the player fall through the platform or into the block when pushing them against a ceiling.
global.blocksCrush = true;          //Makes getting stuck in the wall due to moving blocks or platforms kill the player.

//Player
global.adAlign = false;             //Sets whether or not to enable A/D align
global.edgeDeath = true;            //Sets whether to kill the player when he leaves the boundaries of the room
global.directionalTapFix = false;   //Sets whether to change the behavior of tapping left/right for less than 1 frame (by default the player does not move when this happens, enabling this always moves the player for 1 frame when left/right is tapped)
global.strictSaveBlockers = true;   //Bullets check for saveblocker collision when created instead of only after a frame of movement
global.fixBulletHeight = true;      //Spawns bullets 3px higher, accurate to where the gun is.

//Items
global.secretItemTotal = 0;         //Sets how many secret items for the game to save/load
global.bossItemTotal = 0;           //Sets how many boss items for the game to save/load
global.autosaveSecretItems = false; //Sets whether to save secret items immediately when you grab them or if you have to hit a save

//Controller
global.controllerEnabled = true;    //Sets whether controllers are supported
global.controllerDelayLength = 5;   //Sets the delay in frames in which the player can switch between keyboard/controller (can be set to 0 to disable delay)

//Difficulty
global.difficultyCount = 4;
global.difficultyNames[0] = "Load Game";
global.difficultyNames[1] = "Easy";
global.difficultyNames[2] = "Normal";
global.difficultyNames[3] = "Hard";
global.difficultyNames[4] = "Death";

//Savefiles
global.extraSaveProtection = false; //Sets whether to use the ds_map_secure functions for saving/loading (improves save security and prevents transferring between PCs)
global.md5StrAdd = "TheMagicFlute_FarmerStewie"; //sets what to add to the end of md5 input string to make the save harder to mess with, can be changed to anything, should be set to something unique and hard to predict (like setting a password)

global.cn3Save = true; // let the style of these save points change to CN3 style
global.dotkidUnlock = true; // enable to change to the dotkid be unlocked
global.bowEnabled = false; // control whether to enable the bow
