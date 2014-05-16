/* [Global] */
diameter=58;  //typical values: 52, 58, 62, 67, 72, 77...
wall_thickness=2;
cap_thickness=2; //cap floor
cap_height=7; //total height of the cap

holder_width=3; //small inner frame holding the cap
holder_height=0.5; 

/* [Advanced] */
circle_accuracy=200;
diameter_offset=0.5; //correction from lens diameter

/* [Hidden] */
outter_r=(diameter+wall_thickness)/2;


difference(){
 cylinder(r=outter_r,h=cap_height,$fn=circle_accuracy);
 translate([0,0,cap_thickness])cylinder(r=diameter/2,h=cap_height-cap_thickness-holder_height,$fn=circle_accuracy);
 translate([0,0,cap_thickness])cylinder(r=(diameter-holder_width)/2,h=cap_height,$fn=circle_accuracy);
}