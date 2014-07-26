height=97;
width=60;
wall=1.5;
thick=20;

arm=40; 
foot=35;

radius=26;

module holder(){
difference(){
  union(){
	cube([height+2*wall,thick+2*wall,width+wall]);
	//arm
	cube([wall,arm,width+wall]);
	translate([0,arm,0])cube([5,wall,width+wall]);

	//foot
	translate([height+wall,0,0])cube([wall,foot,width+wall]);
  }

	//inner cut out
	translate([-wall,wall,-wall])cube([height+2*wall,thick,width+4*wall]);

	//back wall
	translate([-5,-5,-5])cube([80,10,2*width]);

	//hole for cam
	translate([35,thick,wall+width/2])rotate([-90,0,0])cylinder(r=radius,h=4*wall,$fn=100);
}
}

translate([-height/2,-width/2,0])holder();

