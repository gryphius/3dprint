BASE_LENGTH=110;
BASE_WIDTH=21.5;
BASE_HEIGHT=5;
HOLE_RADIUS=2;
WALL=1;
FLOOR=2;

module six_holes(){
 xdist=6.5;
 ydist=12;
 for (i= [0:2]){
	translate([i*xdist,0,-1])cylinder(r=HOLE_RADIUS,h=2*BASE_HEIGHT,$fn=100);
   translate([i*xdist,ydist,-1])cylinder(r=HOLE_RADIUS,h=2*BASE_HEIGHT,$fn=100);
 }
}

difference(){
	//base
  hull(){
	cube([BASE_LENGTH-WALL,BASE_WIDTH,BASE_HEIGHT]);
  translate([BASE_LENGTH-WALL,WALL,0])cylinder(r=WALL,h=BASE_HEIGHT,$fn=100);
  translate([BASE_LENGTH-WALL,BASE_WIDTH-WALL,0])cylinder(r=WALL,h=BASE_HEIGHT,$fn=100);
  }

	//inner cut out
	translate([-2*WALL,WALL,FLOOR])cube([BASE_LENGTH,BASE_WIDTH-2*WALL,BASE_HEIGHT]);

  translate([7,5])six_holes();
  translate([87,5])six_holes();
}


module ramp1(){
 ramp1_len=15;
 difference(){
 	union(){
 	cube([ramp1_len,BASE_WIDTH,0.7]);
 	translate([0,BASE_WIDTH/2,-1.3])sphere(r=4,$fn=100);
 	}
   translate([0,0,-10])cube([ramp1_len,BASE_WIDTH,10.01]);
	translate([-10,0,-15])cube([10.01,30,30]);
   	translate([0,BASE_WIDTH/2,-1.5])sphere(r=4,$fn=100);
 }
}

translate([-14,0,3.5])rotate([0,10,0])ramp1();


module ramp2(){
 ramp2_len=17;
 cube([ramp2_len,BASE_WIDTH-4,0.7]);
 rotate([-90,0,0])cylinder(r=1.5,h=BASE_WIDTH-4,$fn=100);
}
translate([-30.8,2,4.38])rotate([0,3,0])ramp2();