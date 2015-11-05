
/* sphere info */
sphere_diameter = 150;
wall=2;

floor_height=4;

/* opening info */
antenna_hole_z = 20;
antenna_hole_diameter = 10;

pir_diameter = 7;

display_hole_height = 10;
display_hole_length = 40;
display_hole_angle = 30;

button_hole_height = 20;
button_hole_length = 20;
button_hole_angle = 50;

/* generic settings */
$fn=90;


/* calculate some stuff */
sphere_radius=sphere_diameter/2;
antenna_hole_radius = antenna_hole_diameter/2;

module half_sphere(radius){
  difference(){   
   sphere(r=radius); 
   translate([-radius,-radius,-radius])cube([2*radius,2*radius,radius]);

  }
}

module empty_half_sphere(radius,wall){
    difference(){
        half_sphere(radius);
        sphere(radius-wall);
    }
}

module rectangular_hole(angle,length,height){
    rotate([0,-angle,0])translate([sphere_radius-4*wall,-length/2,0])cube([8*wall,length,height]);
}


module floor(){
    cylinder(r=sphere_radius-wall-0.2,h=floor_height);
}


module roof(){ 
difference(){
    //the half sphere
    empty_half_sphere(sphere_radius,wall);
    
    //antenna
    translate([-sphere_radius-wall,0,antenna_hole_z])rotate([0,90,0])cylinder( r= antenna_hole_radius, h=sphere_radius );
    
    //pir
    cylinder(r=pir_diameter,h=sphere_radius+wall);
    
    //display
    rectangular_hole(display_hole_angle,display_hole_length,display_hole_height);
    
    //button
    rectangular_hole(button_hole_angle,button_hole_length,button_hole_height);
}
}

color("Blue",0.4)floor();
//color("Red",0.8)roof();





