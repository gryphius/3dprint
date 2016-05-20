radius=50;
$fn=150;
stammhoehe=90;

// 2d primitive for outside fillets.
module fil_2d_o(r, angle=90) {
  intersection() {
    circle(r=r);
    polygon([
      [0, 0],
      [0, r],
      [r * tan(angle/2), r],
      [r * sin(angle), r * cos(angle)]
    ]);
  }
}



// 3d polar outside fillet.
module fil_polar_o(R, r, h, angle=90) {
  union(){
	  translate([0,0,h]) {
		rotate_extrude(convexity=10) {
		    translate([R-r, 0, 0]) {
		      fil_2d_o(r, angle);
		    }
		  }
	      cylinder(r=R-r+0.1, h=r);
      }
      cylinder(r=R, h=h);
  }
}




module pilzdach(){
    translate([0,0,3])difference(){
        scale([1,1,0.6])sphere(r=radius);
        translate([0,0,-radius])cube([2*radius,2*radius,2*radius],center=true);
    }
    translate([0,0,3]) rotate([0,180,0]) fil_polar_o(radius, 2, 1, angle=90);
}

hscale=0.7;
module hohles_pilzdach(){
    difference(){
    union(){
        difference(){
            pilzdach(); 
            translate([0,0,1])scale([0.95,0.95,0.95])pilzdach();
        }
        cylinder(r=(hscale*radius)+2,h=5); 
   }
   translate([0,0,-3])cylinder(r=hscale*radius,h=7);
   translate([0,0,-3])cylinder(r=(hscale*radius)-2,h=20);
   }
   
}



module stamm(){
    
    cylinder(r1=radius/3,r2=hscale*radius,h=stammhoehe);
    
}
module hohler_stamm(){
   difference(){
       stamm();
       translate([0,0,1])scale([0.95,0.95,1.1])stamm();
   }
}


//stamm();
hohles_pilzdach();
//hohler_stamm();

//orig
//%translate([0,0,stammhoehe])hohles_pilzdach();

//printable
//translate([2*radius,0,0])hohles_pilzdach();


