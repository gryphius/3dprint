// height of the inner hole for the screw
innerheight= 16;

difference(){

 //main cylinder
 cylinder(h=48,r=18);


 //subtract inner cylinder, add 1mm below
 translate([0,0,-1]){
  cylinder(h=innerheight,r=5);
 }
 
 //add the two blocks
 rotate([0,0,30]){
   translate([-7.5,-2,-1]){ 
    cube([15,4,innerheight]);
  }  
 }
 rotate([0,0,-30]){
   translate([-7.5,-2,-1]){ 
    cube([15,4,innerheight]);
  }  
 }

 //5mm screw hole
 translate([0,0,-1]){
  cylinder(h=40,r=2.5);
 }


 //screw head
 translate([0,0,17]){
   cylinder(h=50,r=4.5);
 }


 //cylinder hole for the shower head
 translate([-25,0,32.5]){
  rotate([0,90,0]){
   cylinder(h=50,r=11.2);
  }
 }

 //top cube where the tube can be slided in
 translate([-20,-10,32.5]){
   cube([40,20,20]);
 }

}





