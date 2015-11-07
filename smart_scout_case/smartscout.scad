
/* sphere info */
sphere_diameter = 150;
wall=2;

floor_height=4;

/* opening info */
antenna_hole_z = 64;
antenna_hole_diameter = 12;

pir_diameter = 11;

display_hole_height = 16;
display_hole_length = 32;
display_hole_angle = 30;

//button_hole_height = 20;
//button_hole_length = 20;
button_hole_angle = 60;
button_hole_diameter = 18;

led_diameter = 9;
led_angle = 30;

/* generic settings */
$fn=120;


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
    cylinder(r=pir_diameter/2,h=sphere_radius+wall);
    
    //led
    rotate([0,98-led_angle,0])cylinder(r=led_diameter/2,h=sphere_radius+wall);
    
    //display
    rectangular_hole(display_hole_angle,display_hole_length,display_hole_height);
    
    //button
    rotate([0,90-button_hole_angle,0])cylinder(r=button_hole_diameter/2,h=sphere_radius+wall);
    
}
}

//continue failed print
module partial_roof(offset){
  translate([0,0,-offset])difference(){
   roof();  
   translate([0,0,-1])cylinder(r=sphere_radius+10,h=offset+1);   
  }
}


//partial_roof(59);

color("Blue",0.4)floor();
color("Red",0.8)roof();

//5 cm test
//translate([-sphere_radius-5,0,0])cube([3,3,50]);


