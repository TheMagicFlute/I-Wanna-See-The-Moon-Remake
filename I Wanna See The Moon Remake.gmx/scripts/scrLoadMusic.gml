///scrLoadMusic()
//Initializes external music as easily usable global variables

global.stageMusic01 = audio_create_stream("Music/musGuyRock.ogg");
global.bossMusic01 = audio_create_stream("Music/musMegaman.ogg");
global.bossMusic02 = audio_create_stream("Music/musMiku.ogg");

global.deathMusic01 = audio_create_stream("Music/musOnDeath.ogg");
audio_sound_gain(global.deathMusic01,0.5,0);

global.musTitle = audio_create_stream("Music/musTitle.ogg");
global.musEderu_street = audio_create_stream("Music/musEderu_street.ogg");
global.musCherris_Forest = audio_create_stream("Music/musCherris_Forest.ogg");
global.musConvels_Ocean = audio_create_stream("Music/musConvels_Ocean.ogg");
global.musConvels_Frozen = audio_create_stream("Music/musConvels_Frozen.ogg");
global.musDefenders_Cave = audio_create_stream("Music/musDefenders_Cave.ogg");
global.musBoss1 = audio_create_stream("Music/musBoss1.ogg");
global.musCloud_Park = audio_create_stream("Music/musCloud_Park.ogg");
global.musCosmic_Space = audio_create_stream("Music/musCosmic_Space.ogg");
global.musBoss2 = audio_create_stream("Music/musBoss2.ogg");

global.musMystic_Knoll = audio_create_stream("Music/musMystic_Knoll.ogg");

global.musSeashore_Cave = audio_create_stream("Music/musSeashore_Cave.ogg");
global.musAssassin1 = audio_create_stream("Music/musAssassin1.ogg");
global.musMechanic_Castle = audio_create_stream("Music/musMechanic_Castle.ogg");
global.musAssassin2 = audio_create_stream("Music/musAssassin2.ogg");
global.musSpectacle_Space = audio_create_stream("Music/musSpectacle_Space.ogg");
global.musAssassin3 = audio_create_stream("Music/musAssassin3.ogg");

global.musSky_Tower = audio_create_stream("Music/musSky_Tower.ogg");
global.musDeath_Tower = audio_create_stream("Music/musDeath_Tower.ogg");
global.musBoss3 = audio_create_stream("Music/musBoss3.ogg");

global.musCQ = audio_create_stream("Music/musCQ.ogg");
global.musC_ans_X = audio_create_stream("Music/musC_ans_X.ogg");
global.musRemains_Road = audio_create_stream("Music/musRemains_Road.ogg");
global.musThe_Closing_World = audio_create_stream("Music/musThe_Closing_World.ogg");
global.musBoss4 = audio_create_stream("Music/musBoss4.ogg");

global.musBoss5 = audio_create_stream("Music/musBoss5.ogg");

global.musEnding = audio_create_stream("Music/musEnding.ogg");
