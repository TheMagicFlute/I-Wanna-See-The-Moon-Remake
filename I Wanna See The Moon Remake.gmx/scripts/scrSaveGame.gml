///scrSaveGame(saveposition)
///saves the game
///argument0 - sets whether the game should save the player's current location or just save the deaths/time

var savePosition = argument0;

if (savePosition)
{
    global.saveMap[? "room"] = room_get_name(room);
    global.saveMap[? "playerX"] = objPlayer.x;
    // if global.dotkid {
    //     //Prevent saving inside the floor with dotkid
    //     if instance_position(objPlayer.x,objPlayer.y+9,objBlock) {
    //         global.saveMap[? "playerY"] = objPlayer.y - 9;
    //     }
    // } else {
    //     global.saveMap[? "playerY"] = objPlayer.y;
    // }
    global.saveMap[? "playerY"] = objPlayer.y;
    global.saveMap[? "playerXScale"] = objPlayer.xScale;
    global.saveMap[? "grav"] = global.grav;
    
    //Check for floored position shenanigans
    with(objPlayer)
    {
        var px = global.saveMap[? "playerX"];
        var py = global.saveMap[? "playerY"];
        if (!place_free(floor(px), py))
            { global.saveMap[? "playerX"] += 1; }
            
        if (!place_free(px, floor(py)))
            { global.saveMap[? "playerY"] += 1; }
            
        if (!place_free(floor(px), floor(py)))
        {
            global.saveMap[? "playerX"] += 1;
            global.saveMap[? "playerY"] += 1;
        }                               
    }
    global.saveMap[? "playerX"] = floor(global.saveMap[? "playerX"]);
    global.saveMap[? "playerY"] = floor(global.saveMap[? "playerY"]);
    
    
    for (var i = 0; i < global.secretItemTotal; i++)
    {
        global.saveMap[? "secretItem" + string(i)] = global.secretItem[i];
    }
    for (var i = 0; i < global.bossItemTotal; i++)
    {
        global.saveMap[? "bossItem" + string(i)] = global.bossItem[i];
    }
    
    global.saveMap[? "gameClear"] = global.gameClear;
    
    //ADD NEW SAVED VALUES HERE
    global.saveMap[? "diff"] = global.diff;
    global.saveMap[? "playerColor"] = global.playerColor;
    global.saveMap[? "skin"] = skin;
    global.saveMap[? "dotkid"] = global.dotkid;
    global.saveMap[? "bowEnabled"] = global.bowEnabled;
    global.saveMap[? "canViewMap"] = global.canViewMap;
    global.saveMap[? "forestSpdUp"] = global.forestSpdUp;
    global.saveMap[? "forestPlatform"] = global.forestPlatform;
    
}
                     
                              
global.saveMap[? "death"] = global.death;
global.saveMap[? "time"] = global.time;
global.saveMap[? "timeMicro"] = global.timeMicro;
global.saveMap[? "difficulty"] = global.difficulty;

ds_map_delete(global.saveMap, "md5");
global.saveMap[? "md5"] = md5_string_unicode( json_encode(global.saveMap) + global.md5StrAdd );  

//Save map to file
if (global.extraSaveProtection)
{
    ds_map_secure_save(global.saveMap, "Data\save" + string(global.savenum));
}
else
{
    var file = file_text_open_write("Data\save" + string(global.savenum));
    file_text_write_string(file, base64_encode(json_encode(global.saveMap)));
    file_text_close(file);  
}


// ONLINE part
if (global.__ONLINE_ENABLED)
{
    if (!objWorld.__ONLINE_race)
    {
        if (argument0)
        {
            hbuffer_clear(objWorld.__ONLINE_hbuffer);
            __ONLINE_p = objPlayer;
            if instance_exists(__ONLINE_p)
            {
                hbuffer_write_uint8(objWorld.__ONLINE_hbuffer, 5);
                hbuffer_write_uint8(objWorld.__ONLINE_hbuffer, global.grav);
                __ONLINE_tempx = __ONLINE_p.x * 10 + objWorld.__ONLINE_tea;
                hbuffer_write_int32(objWorld.__ONLINE_hbuffer, __ONLINE_tempx);
                hbuffer_write_float64(objWorld.__ONLINE_hbuffer, __ONLINE_p.y);
                hbuffer_write_int16(objWorld.__ONLINE_hbuffer, room);
                socket_write_message(objWorld.__ONLINE_socket, objWorld.__ONLINE_hbuffer);
            }
        }
    }
}

