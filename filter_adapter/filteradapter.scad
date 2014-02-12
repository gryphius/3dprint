use <threads.scad>;

fn=300;
thread_thickness=1;

inner_cylinder_height=5;
inner_cylinder_inner_diameter=62;
inner_cylinder_thickness=3;


outter_cylinder_height=5;
outter_cylinder_outter_diameter=58;
outter_cylinder_thickness=5;

connector_r1=32;
connector_r2=28;
connector_height=3;

module outter(){
  difference(){
	  metric_thread(outter_cylinder_outter_diameter,thread_thickness,outter_cylinder_height);
    translate([0,0,-1])cylinder(h=outter_cylinder_height+2,r=(outter_cylinder_outter_diameter-outter_cylinder_thickness/2)/2, $fn=fn);
  }
}

module inner(){
//inner thread
difference(){
 cylinder(h=inner_cylinder_height, r=(inner_cylinder_inner_diameter+inner_cylinder_thickness/2)/2, $fn=fn);
 
 translate([0,0,-1]){
 metric_thread(inner_cylinder_inner_diameter,thread_thickness,inner_cylinder_height+2,internal=true);

 }
}
}

module connector(){
 difference(){
	 cylinder(h=connector_height,r1=connector_r1,r2=connector_r2,$fn=fn);
	 translate([0,0,-1])cylinder(h=connector_height+2,r=(outter_cylinder_outter_diameter-outter_cylinder_thickness/2)/2,$fn=fn);
 }
}

module adapter(){
	inner();
	translate([0,0,inner_cylinder_height])connector();
	translate([0,0,inner_cylinder_height+connector_height])outter();
}

rotate([0,0,180])adapter();