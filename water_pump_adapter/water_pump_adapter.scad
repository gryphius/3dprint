// water pump adapter

well_inner_diameter=8;

pump_outer_diameter=13;
wiggle_room=0.05;
pump_part_length=7; // how much over the pump
well_part_length=12; // how far should the adapter go into the well 
circle_points = 250;
adapter_wall=1;
middle_piece_length=5;
// -- //

well_inner_radius = well_inner_diameter/2;
pump_outer_radius = pump_outer_diameter / 2;


// pump part

module pump_part(){
    difference(){
        cylinder(h=pump_part_length+adapter_wall, r= pump_outer_radius+adapter_wall/2+wiggle_room/2, $fn=circle_points);
        translate([0,0,-1])cylinder(h=pump_part_length*2, r= pump_outer_radius+wiggle_room/2, $fn=circle_points);
    }
}

module well_part(){
    difference(){
        cylinder(h=well_part_length+adapter_wall, r= well_inner_radius-wiggle_room/2, $fn=circle_points);
        translate([0,0,-1])cylinder(h=well_part_length*2, r= well_inner_radius -adapter_wall/2, $fn=circle_points);
    }
}

module middle_piece(){
    difference(){
    cylinder(h=middle_piece_length, r1=pump_outer_radius+adapter_wall/2+wiggle_room/2, r2=well_inner_radius-wiggle_room/2, $fn=circle_points);
    translate([0,0,-0.001])cylinder(h=middle_piece_length+0.0012, r1=pump_outer_radius+wiggle_room/2, r2=well_inner_radius-adapter_wall/2-wiggle_room/2, $fn=circle_points);
    }
}


module pump(){
    difference(){
        union(){
            pump_part();
            translate([0,0,pump_part_length-0.01])middle_piece();
            translate([0,0,pump_part_length+middle_piece_length-0.02])well_part();
        }
        //cylinder(h=pump_part_length+well_part_length*2, r= well_inner_radius -adapter_wall/2, $fn=circle_points);
    }
    
}

pump();


/*
difference(

);
*/