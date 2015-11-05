sphere_diameter = 15;
$fn=90;

module half_sphere(radius){
  difference(){   
   sphere(r=radius); 
   translate([-radius,-radius,-radius])cube([2*radius,2*radius,radius]);

  }
}



radius=sphere_diameter/2;
half_sphere(radius);

