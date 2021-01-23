entrance_width = 11;
entrance_length = 11;

rail_gap=6;
rail_thickness=3;
rail_depth = 4; 

clearance=1;



hook_base_height=30;
hook_thickness=rail_gap - clearance;
hook_hook_length=25;
hook_hook_tip_length=hook_thickness*2;

slider_base_width = entrance_width - clearance;
slider_base_length = entrance_length - clearance;
slider_base_height = rail_depth - clearance;

circle=500;

module hook(){
    cube([hook_thickness,hook_thickness,hook_base_height]);
    translate([0,0,hook_base_height-hook_thickness])cube([hook_hook_length,hook_thickness,hook_thickness]);
    translate([hook_hook_length-hook_thickness,0,hook_base_height-hook_hook_tip_length])cube([hook_thickness,hook_thickness,hook_hook_tip_length]);
    
}

module curtain_slider(){
    //base
    cube([slider_base_width,slider_base_length,slider_base_height]);
    
    //hook
    translate([slider_base_width/2-hook_thickness/2,0,0])hook();
}


rotate([90,0,0])curtain_slider();
