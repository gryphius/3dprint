back_len=28;
front_len=25;
deep = 17;
height=33;
position=31;
rotation=28;
wall=2;

//all lengths are +1mm to allow some wiggling
keyboard_thickness_front= 8.3;
keyboard_thickness_back = 16;
tablet_thickness = 5;

module holder(){
difference(){
    union(){
    cube([back_len,deep,keyboard_thickness_back+2*wall]);
translate([back_len,0,0])cube([front_len,deep,keyboard_thickness_front+2*wall]);
 translate([position-wall,0,0])rotate([0,-rotation,0])cube([tablet_thickness+wall*2,deep,height]);
    }
translate([2,wall,wall])cube([back_len-2*wall+1,deep,keyboard_thickness_back]);

translate([back_len-2,2,2])cube([front_len+4,deep,keyboard_thickness_front]);

translate([position-1,2,2])rotate([0,-rotation,0])cube([tablet_thickness,deep,height+4]);
    
}
}

module h2(){
translate([back_len,0,0])cube([front_len,deep,keyboard_thickness_front+2*wall]);
     translate([position,0,0])rotate([0,-rotation,0])cube([tablet_thickness+2,deep,height]);
    }

rotate([90,0,0])holder();