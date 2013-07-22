inner_width=69;
inner_length=104;
thickness=2;
height=14;

textcontent="1";
textheight=30;
textspace=0.5;
textthickness=2;
textoffset=10;

//
include <write/Write.scad>

	
//derived
outter_width=inner_width+thickness*2;
outter_length=inner_length+thickness*2;
outter_height=height+thickness;

$fn=100;

module outter_box() {
		minkowski(){
		cylinder(r=2,h=0.0001);
		cube([outter_length,outter_width,outter_height]);
		}
}



module inner_box() {
	cube([inner_length,inner_width,height+1]);
}

//move to center
translate([-outter_length/2,outter_width/2,outter_height]){
//turn around
rotate([180,0,0]){
difference(){
	outter_box();
	translate([thickness,thickness,-1]){
		inner_box();
	}
	translate([outter_length/2-10,outter_width/2+textoffset,outter_height-0.5]){
	 rotate([0,0,-90]){
		 write(textcontent,h=textheight,t=textthickness); 
	 }
	}
	 //screw hole
        translate([65,-outter_width-5,-1]){
                cube([20,outter_width*3,height]);
        }	

}




}
}

