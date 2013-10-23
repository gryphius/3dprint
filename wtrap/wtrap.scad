fn=300;

diameter=70;
height=100;
wall=3;

entry_max_diameter=10;
entry_min_diameter=5;
entry_length=15;
entry_height=80;
entry_wall=1;

/** **/
outter_radius=diameter/2;
inner_radius=outter_radius-wall;

entry_max_r=entry_max_diameter/2;
entry_min_r=entry_min_diameter/2;

difference(){
//outter
cylinder(r=outter_radius,h=height,$fn=fn);
translate([0,0,wall]){
cylinder(r=inner_radius,h=height+1,$fn=fn);
}


//entry cylinder
translate([outter_radius,0,entry_height]){
rotate([0,-90,0]){
 	cylinder(r=entry_max_r,r2=entry_min_r,h=entry_length,$fn=fn);
 }
}

}



//entry
translate([outter_radius,0,entry_height]){
rotate([0,-90,0]){
 difference(){
 	cylinder(r=entry_max_r,r2=entry_min_r,h=entry_length,$fn=fn);
   translate([0,0,-0.1]){
	cylinder(r=entry_max_r-entry_wall,r2=entry_min_r-entry_wall,h=entry_length+2,$fn=fn);
   }
 }
}
}
