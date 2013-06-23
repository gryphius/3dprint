height=130;
diameter=7;

holder_height=2;
holder_diameter=10;
holder_offset=height-30;


/* [Hidden] */
circle_points=100;


// main cylinder
cylinder(h=height,r=diameter/2,$fn=circle_points);

// holder
translate([0,0,holder_offset]){
 cylinder(h=holder_height,r=holder_diameter/2,$fn=circle_points);
}