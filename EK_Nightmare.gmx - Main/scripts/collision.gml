//===Horizontal collision
if(place_meeting(obj_player.x+curspd, obj_player.y, obj_environment)) { 
    while(!place_meeting(obj_player.x+sign(curspd), obj_player.y, obj_environment)){
        obj_player.x  += sign(curspd);
    }
    curspd = 0;
}

//===Vertical collision
if(place_meeting(obj_player.x, obj_player.y+vsp, obj_environment)) { 
    while(!place_meeting(obj_player.x, obj_player.y+sign(vsp), obj_environment)){
        obj_player.y  += sign(vsp);
    }
    vsp = 0;
}
