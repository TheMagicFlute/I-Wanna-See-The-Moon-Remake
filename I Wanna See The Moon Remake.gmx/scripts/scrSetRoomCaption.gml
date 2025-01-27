///scrSetRoomCaption()
///sets the room caption

var roomCaption = global.roomCaptionDef;

if (global.gameStarted)
{
    roomCaption += " -"
    if (global.difficulty == 0)
        roomCaption += " [Easy] ";
    else if (global.difficulty == 1)
        roomCaption += " [Normal] ";
    else if (global.difficulty == 2)
        roomCaption += " [Hard] ";
    else if (global.difficulty == 3)
        roomCaption += " [Death] ";

    if (global.diff == 0)
        roomCaption += "Normal Mode";
    else if (global.diff == 1)
        roomCaption += "Difficult Mode";

    roomCaption += " -";
    roomCaption += " Deaths: " + string(global.death);
    roomCaption += " Time: ";
    
    var t = floor(global.time);
    
    roomCaption += string(t div 3600) + ":";
    t = t mod 3600;
    roomCaption += string(t div 600);
    t = t mod 600;
    roomCaption += string(t div 60) + ":";
    t = t mod 60;
    roomCaption += string(t div 10);
    t = t mod 10;
    roomCaption += string(t);
}

if (roomCaption != global.roomCaptionLast)
{
    window_set_caption(roomCaption);
}

global.roomCaptionLast = roomCaption;
