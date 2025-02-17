///scrPlayerShoot
if global.playerCanShootSave
if instance_exists(objYoshiControl)
{
    audio_play_sound(sndShoot,0,false);
    audio_play_sound(sndDeath,0,0);
    with(objYoshiControl){instance_destroy()}
    objPlayer.mask_index=sprPlayerMask
    objPlayer.y-=(20*global.grav)
    a=instance_create(objPlayer.x,objPlayer.y,objYoshiDead)
    a.image_xscale=objPlayer.xScale
    objPlayer.runSpeed=3
    objPlayer.maxVspeed=9
    objPlayer.jumpSpeed = 8.5*global.grav
    objPlayer.djump = 1
}
else if global.telekid {
    with objPlayer if !instance_exists(objTelekid){
        if !place_meeting(x+(16*xScale),y,objBlock) {
            var t= instance_create(x,y,objTelekid);
            t.hspeed = 4*xScale
            t.image_xscale = xScale
        }
    }
}
else if instance_exists(objKeypickControl) && objKeypickControl.keyCount[K.MASTER] > 0 {
    if objKeypickControl.usingMaster {
        objKeypickControl.usingMaster = false
        audio_play_sound(sndUnmaster,0,0)
    } else {
        objKeypickControl.usingMaster = true
        audio_play_sound(sndMaster,0,0)
    }
}
else if (instance_number(objBullet) + instance_number(objFireBullet) < 4)
{
    if (room == rConvels_Frozen && global.fireBullet)
    {
        bullet = objFireBullet;
    }
    else
    {
        bullet = objBullet;
    }
    if global.dotkid {
        instance_create(x, y - 2 * global.grav, bullet);
    }
    else {
        instance_create(x, y - 3 * global.fixBulletHeight, bullet);
    }
    audio_play_sound(sndShoot, 0, false);
}
