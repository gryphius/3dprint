//adapted from https://github.com/Petraea/PCI-Bracket/blob/master/pci_bracket.scad

thickness=1.5;
$fn=100;

module pci_bracket_closed() {
		union() {
        difference() {
            union () {
                translate([0,-0.25,0]) cube([115,18.5,thickness],center=true);
                translate([58.5,2.5,0]) cube([8,18.5,thickness],center=true);
            }
            translate([57,-13.7,0]) rotate([0,0,40]) cube([10,10,10],center=true);
            translate([55,16,0]) rotate([0,0,40]) cube([10,10,10],center=true);
            translate([-50,-12.5,0]) rotate([0,0,45]) cube([10,10,10],center=true);
            translate([-50,12.5,0]) rotate([0,0,45]) cube([10,10,10],center=true);
            translate([-55,-10.5,0]) cube([10,10,10],center=true);
            translate([-55,10.5,0]) cube([10,10,10],center=true);
        }
        difference() {
            translate([62,2.5,6]) cube([thickness,18.5,11],center=true);
            translate([62,10.75,5.5]) cube([2,6,4],center=true);
            translate([62,8,5.5]) rotate([0,90,0]) cylinder(r=2,h=2,center=true);
        }
    }
}

module card_mount(){
    card_mount_length=13;
		card_mount_width=8;
		cube([card_mount_width,card_mount_length,thickness]);
	//TODO: screw hole
}

module sfp_hole(){
    sfp_hole_width=16;
		sfp_hole_height=11;
		translate([0,0,-thickness])cube([sfp_hole_width,sfp_hole_height,3*thickness]);
}

module led_hole(){
    led_hole_radius=0.7;
		translate([0,0,-thickness])cylinder(r=led_hole_radius,h=3*thickness);
}


module pci_bracket_solarflare_singleport(){
//uncomment to add the rail.. but makes it harder to print , not much benefit
//rotate([90,0,0])
difference(){
        //move to the origin
		translate([115/2,(18.5/2)+0.25,thickness/2])pci_bracket_closed();
		// SFP
		translate([25.0,3.0,0])sfp_hole();

		// LINK
		translate([25.0-2,3.5,0])led_hole();

		// ACT
		translate([25.0+16+2,3.5,0])led_hole();
}


//uncomment to add the rail.. but makes it harder to print , not much benefit
//translate([16,0,0])card_mount();
//translate([70,0,0])card_mount();
//rail
//translate([16,0,0])cube([54.0,1.5,thickness]);
}

pci_bracket_solarflare_singleport();
