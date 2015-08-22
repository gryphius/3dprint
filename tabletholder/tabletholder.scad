back_len=25;
front_len=25;
deep = 17;

height=30;

position=28;

rotation=30;

//all lengths are +1mm to allow some wiggling
keyboard_thickness_front= 10;
keyboard_thickness_back = 19;
tablet_thickness = 10;

module holder(){
difference(){
    union(){
cube([back_len,deep,keyboard_thickness_back+4]);
translate([back_len,0,0])cube([front_len,deep,keyboard_thickness_front+4]);
 translate([position,0,0])rotate([0,-30,0])cube([tablet_thickness+2,deep,height]);
    }

translate([-1,2,2])cube([back_len+2,deep,keyboard_thickness_back]);

translate([back_len-1,2,2])cube([front_len+4,deep,keyboard_thickness_front]);

translate([position-1,2,2])rotate([0,-30,0])cube([tablet_thickness,deep,height+4]);
    
}
}

rotate([90,0,0])holder();