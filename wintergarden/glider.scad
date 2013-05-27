laenge=50;
breite=12;
hoehe=18;
radius=7.98/2;

//nute
//kurze seite=math.sqrt(1^2+2.5^2)
nute=2.69;

difference(){
	//klotz
	cube([laenge,breite,hoehe]);

	//loch in der mitte
	translate([laenge/2,breite/2,-1]){
		cylinder(r=radius,h=hoehe+2,center=True,$fn=1000);
	}
	
	//nute
	translate([-1,breite/2,-2]){
		rotate([45,0,0]){
 			cube([laenge+2,nute,nute]);
		}
	}
}



