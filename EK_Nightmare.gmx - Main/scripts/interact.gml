inst = instance_place(obj_player.x, obj_player.y, obj_items);
if(place_meeting(obj_player.x, obj_player.y, obj_items)) {
    inst.desired_response = 2;
    for(i = 0; i < instance_number(obj_camp_fire); i++) {
        if(instance_find(obj_camp_fire,i).response == 2) {
            inst.desired_response = 1;
        }
    }
    inst.response = inst.desired_response;
    inst.interacted_with = true;
}

mystates = mystates.mymove;
