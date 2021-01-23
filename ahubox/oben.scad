wall_thickness=3;
floor_thickness=wall_thickness;

total_height = 60;

box1_width=80-2*wall_thickness;
box2_width=50-wall_thickness;
box3_width=20-wall_thickness;
total_width=box1_width+box2_width+box3_width+4*wall_thickness;

box_length=35-2*wall_thickness;
total_length=box_length+2*wall_thickness;

echo("Total w=", total_width, " and l=", total_length);

difference(){
    cube([total_width,total_length,total_height]);
    //box1   
    translate([wall_thickness,wall_thickness,floor_thickness])cube([box1_width,box_length,total_height]);
    //box2
    translate([wall_thickness*2+box1_width,wall_thickness,floor_thickness])cube([box2_width,box_length,total_height]);
    //box3
    translate([wall_thickness*3+box1_width+box2_width,wall_thickness,floor_thickness])cube([box3_width,box_length,total_height]);
}

