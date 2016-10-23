script_execute(GetKeysPressed);

hsp = d_key - a_key; //===THIS IS JUST DIRECTION
if(hsp != 0 ) { 
    dir = hsp;
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

//===Grounded code
if(place_meeting(obj_player.x, obj_player.y + 1, obj_environment)) {
    curJump = maxJump;
    gravInc = 1;
    grounded = true;    
} else {
    curJump = maxJump - 1;
    grounded = false;
}

//===Jumping Code
if(grounded) {
    vsp = space_key * -jumpspeed;
}
//===Wall jump, right wall
if(place_meeting(obj_player.x + 1, obj_player.y, obj_environment) && maxJump > 0) {
    if(!grounded) {
        i = 0;
        fall = false;
        mystates = mystates.walljump;
        script_execute(wallJump);
    }
}
//===Wall jump, left wall
if(place_meeting(obj_player.x - 1, obj_player.y, obj_environment) && maxJump > 0) {
    if(!grounded) {
        i = 0;
        fall = false;
        mystates = mystates.walljump;
        script_execute(wallJump);
    }
}
script_execute(collision);

//===Applying given numbers.
obj_player.x += curspd;
obj_player.y += vsp;

if(keyboard_check_pressed(ord('E'))) {
    //===Sprite = atksprite
    mystates = mystates.myinteract;
    //===image_speed
    script_execute(interact);
}
