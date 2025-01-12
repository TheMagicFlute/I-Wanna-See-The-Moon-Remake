///scrLoadGame(loadfile)
///loads the game
///argument0 - sets whether or not to read the save file when loading the game

var loadFile = argument0;

if (loadFile)
{          
    //Open map from file
    if (global.extraSaveProtection)
    {
        global.saveMap = ds_map_secure_load("Data\save" + string(global.savenum));  
    }
    else
    {
        var file = file_text_open_read("Data\save" + string(global.savenum));   
        global.saveMap = json_decode(base64_decode(file_text_read_string(file)));  
        file_text_close(file);
    }
    
    if (!scrValidateSaveMap(global.saveMap))
    {
        show_message("Save invalid!");
        scrRestartGame();
        exit;
    }
      
    global.death = global.saveMap[? "death"];
    global.time = global.saveMap[? "time"];
    global.timeMicro = global.saveMap[? "timeMicro"];
    global.difficulty = global.saveMap[? "difficulty"];
}


with(objPlayer)
    { instance_destroy(); }

global.gameStarted = true;  //sets game in progress (enables saving, restarting, etc.)
global.noPause = false;     //disable no pause mode
global.autosave = false;    //disable autosaving since we're loading the game

global.grav = global.saveMap[? "grav"];

for (var i = 0; i < global.secretItemTotal; i++)
{
    global.secretItem[i] = global.saveMap[? "secretItem" + string(i)];
}

for (var i = 0; i < global.bossItemTotal; i++)
{
    global.bossItem[i] = global.saveMap[? "bossItem" + string(i)];
}

global.gameClear = global.saveMap[? "gameClear"];

//LOAD NEW SAVED VALUES HERE
global.diff = global.saveMap[? "diff"];
global.playerColor = global.saveMap[? "playerColor"];
skin = global.saveMap[? "skin"];
global.dotkid = global.saveMap[? "dotkid"];
global.bowEnabled = global.saveMap[? "bowEnabled"];
global.canViewMap = global.saveMap[? "canViewMap"];
global.forestSpdUp = global.saveMap[? "forestSpdUp"];
global.forestPlatform = global.saveMap[? "forestPlatform"];

var player = instance_create(global.saveMap[? "playerX"], global.saveMap[? "playerY"], objPlayer);
// show_message("Load Y: " + string(objPlayer.y));
with (player)
{
    xScale = global.saveMap[? "playerXScale"];
}

room_goto(asset_get_index(global.saveMap[? "room"]));


// ONLINE part

if (global.__ONLINE_ENABLED)
{
    if (objWorld.__ONLINE_sSaved)
    {
        if (room_exists(objWorld.__ONLINE_sRoom))
        {
            __ONLINE_p = objPlayer;
            if (global.grav != objWorld.__ONLINE_sGravity)
            {
                with (__ONLINE_p) event_user(0);
            }
            __ONLINE_p = objPlayer;
            __ONLINE_p.x = objWorld.__ONLINE_sX;
            __ONLINE_p.y = objWorld.__ONLINE_sY;
            room_goto(objWorld.__ONLINE_sRoom);
        }
        objWorld.__ONLINE_sSaved = 0;
    }
}

