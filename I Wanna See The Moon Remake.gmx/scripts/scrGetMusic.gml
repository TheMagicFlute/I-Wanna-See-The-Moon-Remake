///scrGetMusic()
//Gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //Determines which song to play
{
    case rTitle:                    //Add rooms here, if you have several rooms that play the same song they can be put together
    case rMenu:
    case rOptions:
    case rDifficultySelect:
        roomSong = global.musTitle;
        break;
    
    case rEderu_Street:
        roomSong = global.musEderu_street;
        break;
    case rCherris_Forest:
        roomSong = global.musCherris_Forest;
        break;
    case rConvels_Ocean:
        roomSong = global.musConvels_Ocean;
        break;
    case rConvels_Frozen:
        roomSong = global.musConvels_Frozen;
        break;
    case rDefenders_Cave:
        roomSong = global.musDefenders_Cave;
        break;


    case rSample:                                                                                                            
        roomSong = global.stageMusic01;
        break;                      //Make sure to always put a break after setting the song
        
    case rCherryBoss:
        roomSong = global.bossMusic01;
        break;
        
    case rMiku:
        roomSong = -2;              //Don't change the music in any way (the Miku object plays it)
        break;
        
    case rEnd:
    case rDiffSelect:
    default:
        roomSong = -1;              //Play nothing
        break;
}

if (roomSong != -2)
{
    scrPlayMusic(roomSong, true);
}
