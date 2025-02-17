///scrInitializeGlobals()
//Initializes all global variables needed for the game

scrSetGlobalOptions();

global.debugOverlay = false;    //Enables showing the debug text overlay (shows player location, align, etc.)
global.debugNoDeath = false;    //Enables god mode (toggle with Home key)
global.debugInfJump = false;    //Enables infinite jump (toggle with End key)
global.debugShowHitbox = false; //Enables showing the player's hitbox (toggle with Del key)

global.roomCaptionLast = global.roomCaptionDef;
window_set_caption(global.roomCaptionDef);

global.saveMap = ds_map_create();

global.savenum = 1;
global.difficulty = 0;  //0 = Easy, 1 = Normal, 2 = Hard, 3 = Death
global.death = 0;
global.time = 0;
global.timeMicro = 0;
global.grav = 1;

// Game variables
global.diff = 0; // 0: normal; 1: more needles;
global.canViewMap = false; // false: can't view map; true: can view map
global.playerColor = 0.5;
globalvar skin;
skin = SKIN.DEFAULT;
global.dotkid = false;
global.fireBullet = false; // false: disabled; true: can shoot fire bullets
global.forestSpdUp = false; // false: disabled; true: enable the spd up line
global.forestPlatform = false; // false: disabled; true: can go to the ocean
global.frozenLastSpikeDestroyed = false; // false: not destroyed; true: destroyed
global.cloudEye = false; // false: disabled; true: can enter the castle
global.keyToSpecticalSpace = false; // false: disabled; true: enable the key
global.DoorToSpecticalSpaceDestroyed = false; // false: not destroyed; true: destroyed

global.door = ds_map_create(); // control the forest doors
global.water = ds_map_create(); // control the ocean water

// Bosses and Assassins variables (use these to instead of the bosses array)
global.boss1 = false;
global.boss2 = false;
global.assassin1 = false;
global.assassin2 = false;
global.assassin3 = false;
global.boss3 = false;
global.boss4 = false;
global.boss5 = false;

// ONLINE
global.showONLINEinfo = false; // Set to true to show online info in screen
global.__ONLINE_ENABLED = false; // Set to true to enable online features

for (var i = global.secretItemTotal - 1; i >= 0; i--)
{
    global.secretItem[i] = false;
}

for (var i = global.bossItemTotal - 1; i >= 0; i--)
{
    global.bossItem[i] = false;
}

global.gameClear = false;

global.trigger = ds_map_create();

global.gameStarted = false;     //Determines whether the game is in progress (enables saving, restarting, etc.)
global.noPause = false;         //Used to prevent pausing, for example in bossfights
global.autosave = false;        //Used to autosave the next time the player is created
global.noDeath = false;
global.infJump = false;
global.dotkid = false;
global.telekid = false;
global.playerV = false;
global.invertControls = false;
global.bowEnabled = true;       // control whether to enable the bow

global.count = 0; //Oscillation timer

scrParticles() //Initialize Particle Systems

global.gamePaused = false;
global.pauseSurf = -1;          //Stores the screen surface when the game is paused
global.pauseDelay = 0;          //Sets pause delay so that the player can't quickly pause buffer

scrLoadMusic();
global.currentMusicID = -1;     //Current music
global.currentMusic = -1;       //Sound instance of the current music
global.deathSound = -1;         
global.gameOverMusic = -1;      
global.musicFading = false;     //Used for music fading out on death
global.currentGain = 0;         //Used for music fading out on death

global.menuSelectPrev[0] = 0;   //Keeps track of the previously selected option when navigating away from the difficulty menu
global.menuSelectPrev[1] = 0;   //Keeps track of the previously selected option when navigating away from the options menu

//Get the default window size
global.windowWidth = surface_get_width(application_surface);
global.windowHeight = surface_get_height(application_surface);

//Keeps track of previous window position/size when display_reset is used for setting vsync
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(surface_get_width(application_surface), surface_get_height(application_surface));  //set the correct gui size for the Draw GUI event

global.controllerMode = false;  //Keeps track of whether to use keyboard or controller
global.controllerDelay = -1;    //Handles delay between switching between keyboard/controller so that the player can't use both at the same time

global.newestVersionNumber = "";
global.newestVersionLink = "";
global.isUpToDate = true;

global.options = ds_list_create();
scrOptionsList();

global.makingTrigger = false;
global.triggers = ds_list_create();
scrTriggerList();

//keypick stuff
enum K {
    MASTER = 0,
    WHITE = 1,
    PURPLE = 2,
    ORANGE = 3,
    BLACK = 4,
    TEAL = 5,
    GREEN = 6,
    RED = 7,
    BROWN = 8,
    PINK = 9,
    BLUE = 10,
}

randomize();    //Make sure the game starts with a random seed for RNG
