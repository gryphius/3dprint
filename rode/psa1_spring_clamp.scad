width=5;
length=65;
height=15;
thickness=5;

holder_thickness=4;
holder_length=3;


module arm(){
	cube([width,thickness,height+holder_thickness+1]);
}
module holder(){
	cube([width,holder_length+1,holder_thickness]);
}


module psa1_clamp_holder(){
	cube([width,length+2*thickness,thickness]);

	translate([0,0,thickness-1])arm();
	translate([0,thickness-1,thickness+height])holder();

	translate([0,length+thickness,thickness-1])arm();
	translate([0,length+thickness-holder_length,thickness+height])holder();
}

translate([0,0,width])rotate([0,90,0])psa1_clamp_holder();