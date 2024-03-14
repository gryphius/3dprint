
/* [Global] */
coin_diameter=20;
coin_thickness=2;

/* [Hidden] */
radius=coin_diameter/2;
fn=300;


module base(){
	 color("grey")cylinder(h=coin_thickness, r=radius, $fn=fn);
}

module f(){
    h_width = 0.1*coin_diameter;
    h_height = coin_thickness*3;
    translate([-0.2*radius,0,0])cube([h_width,0.7*coin_diameter,h_height], center=true);
    translate([0,0,0])cube([0.4*radius, h_width,h_height], center=true);
    translate([0,0.6*radius,0])cube([0.6*radius, h_width,h_height], center=true);
}

module token(){
    difference(){
        base();
        f();
    }
}

token();

