// width of the slot holding the paper - should be a little more than the paper thickness
slot_width= 3;

// height of the rail which holds the paper - this amount will invisible from the bottom part
rail_height = 100;
rail_length = 50;
rail_wall_width = 5;
rail_floor_height =5;

socket_hight=1000;


// A4 page
a4_length = 210;
a4_height = 297;


module a4_slot(){
    color("white")cube([a4_length,slot_width,a4_height]);
}

module rail(){
    difference(){
        cube([rail_length,2*rail_wall_width+slot_width,rail_height]);
        translate([-0.01,rail_wall_width,rail_floor_height])a4_slot();    
    }
    
}


rail();

//a4_slot();