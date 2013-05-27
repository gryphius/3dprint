radius=20;
height=123;
wall=5;
holder=15;
belt=3;
corner=6;

//bottle cylinder
difference(){
	cylinder(h=height,r=radius,center=True,$fn=1000);
	translate([0,0,wall]){
		cylinder(h=height,r=radius-(wall/2),center=True,$fn=1000);
	}
}

//holder
difference(){
	translate([radius-2,-holder/2,0]){
		cube([holder,holder,height]);
	}
	//belt 
	translate([radius+3,-holder/2-1,-1]){
		cube([belt,holder+2,height-10]);
	}

	translate([radius-1,-holder/2-1,-1]){
		cube([5,holder+2,height-70]);
	}

	//lower corner
	translate([radius+3,-50,height-75]){
		rotate([0,-45,0]){
			cube([corner,100,corner]);
		}
	}


	translate([radius+5,-holder/2-1,-1]){
		cube([10,holder+2,height-65]);
	}
	
	translate([radius+10,-holder/2-1,-1]){
		cube([10,holder+2,height-20]);
	}

	//outer corner
	translate([radius+15,-50,height-25]){
		rotate([0,-45,0]){
			cube([corner,100,corner]);
		}
	}

	//upper corner
	translate([radius+13,-50,height-3]){
		rotate([0,-45,0]){
			cube([corner,100,corner]);
		}
	}
}

//support
sup=1.5;
difference(){
translate([radius+6,-holder/2,0]){
	cube([4,holder,height-69]); //67
}

}

translate([radius+6,-holder/2,height-69]){
	cube([sup,sup,4]);
}

translate([radius+6,-holder/2+holder-sup,height-69]){
	cube([sup,sup,4]); 
}

translate([radius+10-sup,-holder/2+holder-sup,height-69]){
	cube([sup,sup,4]); 
}

translate([radius+10-sup,-holder/2,height-69]){
	cube([sup,sup,4]); 
}

translate([radius+2,-holder/2-5,0]){
	cube([10,holder+10,2]); //67
}