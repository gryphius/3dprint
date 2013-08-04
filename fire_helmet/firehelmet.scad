diameter=35;
outter_diameter=38;
fn=100;

radius=diameter/2;
outter_radius=outter_diameter/2;
arc_size=1;
module cutoff(){
//cut off lower half
 translate([-outter_radius*2,-outter_radius*2,-outter_radius*2]){
   cube([outter_radius*4,outter_radius*4,outter_radius*2]);
 }
}

module hat_arc(rot){
 difference(){
 rotate([0,0,rot]){
 translate([-arc_size/2,0,0]){

 rotate([0,90,0]){
  rotate_extrude($fn=fn){
   translate([outter_radius,0,0]){
    square(arc_size,arc_size);
   }
  }
 }
 }

 }
 cutoff();
 }
}

//outter sphere
difference(){
sphere(outter_radius,$fn=fn);
translate([0,0,-0.1]){
sphere(radius,$fn=fn);
}
cutoff();
}

hat_arc(0);
hat_arc(45);
hat_arc(90);
hat_arc(-45);


difference(){
hull(){
translate([10,0,0]){
cylinder(r=22,h=2,$fn=fn);
}
translate([-12,0,0]){
cylinder(r=18,h=2,$fn=fn);
}
}



translate([0,0,-0.001]){
sphere(radius,$fn=fn);
}

}

