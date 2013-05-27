/* [Global] */
hole_diameter = 10;
height = 30; // [1:100]
wall_thickness = 2; // [1:10]

/* [Hidden] */
cut_off = 1;

//derived vars
inner_radius = hole_diameter/2;
total_length = hole_diameter+2*wall_thickness;
outter_radius = total_length/2;
half_length = outter_radius;
cylinder_height = height - outter_radius + cut_off;

module protector(){

	//cylinder
	difference(){
		cylinder(h=cylinder_height,r=outter_radius,center=True,$fn=500);
		cylinder(h=cylinder_height+1,r=inner_radius,center=True,$fn=500);
	}

	//sphere
	difference(){
		sphere(outter_radius,$fn=500);
		cylinder(h=cylinder_height,r=outter_radius,center=True,$fn=500);
	}

}

difference(){
	translate([0,0,outter_radius-cut_off]){
		protector();
	}
	//block below ground to cut off
	translate([-half_length,-half_length,-total_length]){
		cube([total_length,total_length,total_length]);
	}
	
}


