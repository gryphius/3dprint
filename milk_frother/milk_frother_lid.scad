rim_tickness = 4 ;

lid_radius=62;

lid_thickness = 4;

inner_height=13;
inner_radius=56;
inner_thickness=3.5;

fn=500;

hole_radius=1;


module lid(){
    cylinder(r=lid_radius,h=lid_thickness,$fn=fn);
}

module ring(){
  difference(){
    cylinder(r=inner_radius,h=inner_height,$fn=fn);
    translate([0,0,-1])cylinder(r=inner_radius-inner_thickness,h=inner_height+2,$fn=fn);
  }
}

module all(){
    difference(){
        union(){
            lid();
            ring();
        }
        translate([20,0,-1])cylinder(r=hole_radius,h=lid_thickness+4,$fn=fn);
        translate([0,0,6])cut_ring();
    }
}
    
//all();

module cut_ring(){
    difference(){
     cylinder(r=inner_radius+inner_thickness+1,h=5,$fn=fn);
    translate([0,0,-1])cylinder(r=inner_radius-inner_thickness/2,h=7,$fn=fn);
    }
}

all();
