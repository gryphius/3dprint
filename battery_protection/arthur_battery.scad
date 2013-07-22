
inner_length_long=49.5;
inner_length_short=47.5;
inner_width=37;
short_width=16;
height=10.5;
wall_thickness=1.5;
floor_cutout_length=15;

//derived
long_width=inner_width-short_width;

outter_length=inner_length_long+2*wall_thickness;
outter_width=inner_width+2*wall_thickness;


//move the whole thing to the center
translate([-outter_width/2,-outter_length/2,0]){

difference(){
//main cube
cube([outter_width,outter_length,height]);

//cut out long part
translate([wall_thickness,wall_thickness,wall_thickness]){
 cube([long_width,inner_length_long,height]);
}

//cut out short part
translate([wall_thickness+long_width-1,wall_thickness,wall_thickness]){
 cube([short_width+1,inner_length_short,height]);
}

//cut out floor
translate([outter_width/2-floor_cutout_length/2,wall_thickness+inner_length_short-floor_cutout_length,-1]){
 cube([floor_cutout_length,floor_cutout_length,wall_thickness*2]);
}

}

}

