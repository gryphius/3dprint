//based on http://www.thingiverse.com/thing:47270
//adapted for model B+

width = 60.5;
length = 90.0;
thickness = 2;

total_height = 28;

// Raspberry PI
*translate([43.4+thickness,28.5+thickness,6.5]) {
	import("../RaspberryPi_B.stl");
}

// ----- Modules -----//

// Base box
module basebox() {
	difference() {
		cube([length+(thickness*2),(width+(thickness*2))-2.5,14]);
		
		translate ([thickness, thickness, thickness]) {
			cube([length,width-2.5,28]);
		}
	}
}
//basebox();

// Top box
module topbox() {
	translate([0,0,14]) {
		difference() {
			cube([length+(thickness*2),(width+(thickness*2))-2.5,14]);
			
			translate ([thickness, thickness, -thickness]) {
				cube([length,width-2.5,14]);
			}
		}
	}
}


// Hole - Digital
module digital() { //<-- moved for B+
	translate ([57,-0.1,10]) { //pos=70
		rotate([-90,90,0]) cylinder(3,4.2,3.2,$fn=25);
	}
}


// Hole - HDMI
module hdmi() {
	translate ([27,-1,10.5]) {
		hull(){
		cube([15,4,4]);
		translate([2.5,0,-2.5]) cube([10,4,1]);
		}
	}
}

// Hole - Ethernet
module ethernet() {
	union() {
	translate ([length,5,11.5]) cube([5,14,8.5]);
	translate ([length,8.5,9.7]) cube([5,7,2]);
	translate ([length,9.5,8.5]) cube([5,5,2]);
	}
}


// Hole - USB
module usb() {
	translate ([length,26.6,17.5]) cube([5,13.1,5.5]);
	translate ([length,26.6,8.8]) cube([5,13.1,5.5]);
	translate ([length,44,17.5]) cube([5,13.1,5.5]); //<-- added for B+
	translate ([length,44,8.8]) cube([5,13.1,5.5]); //<-- added for B+
}


// Hole - Power
module power() { //<-- rotated and repositioned for B+
	rotate([0,0,90]){ 
		hull() {
			translate ([-1,-17,9]) cube([4,7.9,2]);
			translate ([-1,-16,8]) cube([4,5.9,.2]);
		}
	}	
}
//power();
// Hole - SD Card
module sdcard() {
	translate ([-1,24,3]) cube([8,14,3.5]); //<-- changed for B+ sd -> microsd (28->14)
}



// Ventilation
module vents() {
  cube([2,10,10]);
  translate([4,0,0]) cube([2,10,10]);
  translate([8,0,0]) cube([2,10,10]);
}


// Elements //

*difference() {
	union() {
		difference() {
			basebox();
			ethernet();
			
		}
	translate ([2,58,2]) cube([20,2,4]);
	translate ([2,2,2]) cube([20,2,4]);
	translate ([66,58,2]) cube([20,2,4]);
	translate ([59,2,2]) cube([20,2,4]);
	}

	digital();
	hdmi();
	usb();
	power();
	sdcard();
}

difference() {
	union() {
		difference() {
			topbox();
			ethernet();
		}
	translate ([63,2,9]) cube([20,2,17]);
	//translate ([18,2,9]) cube([20,2,17]);
	translate ([64,58,9]) cube([20,2,17]);
	translate ([18,58,11]) cube([20,2,15]);
	translate ([2,20,9]) cube([2,20,17]);
	}

	digital();
	hdmi();
	usb();
	translate([5,-1,19]) vents();
	translate([5,53,19]) vents();
}

