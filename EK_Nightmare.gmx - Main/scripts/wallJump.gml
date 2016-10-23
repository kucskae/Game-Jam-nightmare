script_execute(GetKeysPressed);
if(place_meeting(obj_player.x, obj_player.y + 1, obj_environment)) {
    curJump = maxJump;
    gravInc = 1;
    grounded = true;
    mystates = mystates.mymove;
    script_execute(move);
}
hsp = d_key -a_key;
if(hsp != 0) {
    dir = hsp;
}
if(place_meeting(obj_player.x + 1, obj_player.y, obj_environment)) {
    if(space_key && maxJump > 0) {
        curJump -= 1;
        curspd = -6;
        dir = -1;
        vsp = space_key * (-jumpspeed);
    }
}
if(place_meeting(obj_player.x - 1, obj_player.y, obj_environment)) {
    if(space_key && maxJump > 0) {
        curJump -= 1;
        curspd = 6;
        dir = 1;
        vsp = space_key * (-jumpspeed);
    }
}
if(vsp < 10) {
    if(gravINC == 5) {
        vsp += grav;
        gravINC = 0;
    } else {
        gravINC += 1;
    }
}

if(hsp == 0) { //===They aren't pressing the keys slow down
    if(spdINC >= 1) {
        if(curspd != 0) {
            curspd += -sign(curspd);
            spdINC = 0;
        }
    } else {
        spdINC += 1;
    }
} else { //===They are moving so add to it
    if(spdINC >= 1) {
        if(curspd < maxspd && curspd > -maxspd) {
            curspd += hsp;
            spdINC = 0;
        } else {
            curspd += -sign(curspd);
            spdINC += 1;
        }
    } else {
        spdINC += 1;
    }
}

script_execute(collision);

obj_player.x += curspd;
obj_player.y += vsp;
