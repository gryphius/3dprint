include <write/Write.scad>


/* [Global] */
diameter=67;
height=90;
wall=5;
text="AHUEFA";
textheight=10;


/* [Hidden] */
radius=diameter/2;
corner=6;
fn=300;


translate([0,-radius,0]){
//bottle cylinder
difference(){
	cylinder(h=height,r=radius,center=True,$fn=fn);
	translate([0,0,wall]){
		cylinder(h=height,r=radius-(wall/2),center=True,$fn=fn);
	}


	 writecylinder(text,[0,0,height/2],h=textheight,radius-0.5,height,rotate=0,center=true);
}


translate([diameter+10,diameter+20,0]){
//bottle cylinder
difference(){
	cylinder(h=height,r=radius,center=True,$fn=fn);
	translate([0,0,wall]){
		cylinder(h=height,r=radius-(wall/2),center=True,$fn=fn);
	}


	 writecylinder("UZI",[0,0,height/2],h=textheight,radius-0.5,height,rotate=0,center=true);
}
}
}