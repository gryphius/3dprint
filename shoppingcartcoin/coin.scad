diameter=27;
radius=diameter/2;
fn=300;
h=2;

module cat(){
 r=8;
 h=0.5; 
 cylinder(h=h,r=r,$fn=fn);

 translate([6,6,0]){
  rotate([0,0,-75]){
  cylinder(h=h,r=4,$fn=3);
  }
 }


 translate([6,-6,0]){
  rotate([0,0,75]){
  cylinder(h=h,r=4,$fn=3);
  }
 }

}



difference(){
 cylinder(h=h, r=radius, $fn=fn);
  translate([radius-1.5-3,0,-1]){
   cylinder(h=h+2, r=1.5, $fn=fn);
  } 


 translate([-2,0,h-0.45]){	
 cat();
 }


}







