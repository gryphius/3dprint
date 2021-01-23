wall_thickness=3;
floor_thickness=wall_thickness;

total_height = 110;

box1_width=80-2*wall_thickness;
box2_width=70-wall_thickness;
total_width=box1_width+box2_width+3*wall_thickness;

box_length=35-2*wall_thickness;
total_length=box_length+2*wall_thickness;

z_offset=40;

echo("Total w=", total_width, " and l=", total_length);

difference(){
    cube([total_width,total_length,total_height]);
    //box1   
    translate([wall_thickness,wall_thickness,floor_thickness])cube([box1_width,box_length,total_height]);
    
    // upper part cut
        translate([wall_thickness,-wall_thickness,floor_thickness+z_offset])cube([box1_width,box_length,total_height]);
    
    //box2
    translate([wall_thickness*2+box1_width,wall_thickness,floor_thickness])cube([box2_width,box_length,total_height]);
    
    translate([wall_thickness*2+box1_width,-wall_thickness,floor_thickness+z_offset])cube([box2_width,box_length,total_height]);
}

