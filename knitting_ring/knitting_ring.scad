outter_radius = 20;
inner_radius = 10;
thickness = 1;
height = 10;
acc = 150;
knob_radius=1.5;

module half_ring(){
    difference(){
        cylinder(r=outter_radius,h=thickness,$fn=acc);
        translate([0,0,-1]){
            cylinder(r=inner_radius,h=thickness+2,$fn=acc);
        }
        
        translate([-2*outter_radius,0,-1]){
            cube([4*outter_radius,2*outter_radius,2*outter_radius]);
        }
        
        
    }
}

module block(){
    difference(){
        cube([outter_radius-inner_radius,3*thickness,height]);
        translate([-1,thickness,-thickness])cube([outter_radius-inner_radius+2,thickness,height]);
    }
}

module part1(){
    half_ring();
    translate([-outter_radius,0,0])block();
    translate([inner_radius,0,0])block();
}


module smallblock(){
    cube([outter_radius-inner_radius,thickness,height]);
}
module knob(){
    difference(){
        sphere(r=knob_radius,$fn=acc);
        translate([-knob_radius*2,-knob_radius*2,0])cube([knob_radius*4,knob_radius*4,knob_radius*2]);
    }
}
module part2(){
    half_ring();
    translate([-outter_radius,0,0])smallblock();
    translate([inner_radius,0,0])smallblock();
    half_circ=(outter_radius-inner_radius)/2;
    translate([0,-(inner_radius+half_circ),0])knob();
    
    translate([inner_radius+half_circ,-knob_radius,0])knob();
    translate([-(inner_radius+half_circ),-knob_radius,0])knob();
}
translate([outter_radius,0,0])part1();
translate([-outter_radius-2,0,thickness])rotate([-90,0,0])part2();

