
// circle points
FN=250;

difference(){

 //main cylinder
 cylinder(h=48,r=18,$fn=FN);

 //cylinder hole for the shower head
 translate([-25,0,32.5]){
  rotate([0,90,0]){
   cylinder(h=50,r=11.2,$fn=FN);
  }
 }

 //top cube where the tube can be slided in
 translate([-20,-10,32.5]){
   cube([40,20,20]);
 }

}
// hook
translate([-40,0,0])cylinder(h=20,r=5,$fn=FN);
translate([-40,0,15])rotate([0,90,0])cylinder(h=40,r=5,$fn=FN);
//translate([-35,0,0])cylinder(h=3,r=5,$fn=FN);
translate([-40,-5,0])cube([15,10,3]);
translate([-30,-5,0])cube([5,10,6]);