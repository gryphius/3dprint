wall=0.5;
fn=50;
toppart_extension=10;
toppart_inerradius=10;
toppart_outterradius=toppart_inerradius+wall;

module dome(radius){
 difference(){
  sphere(r=radius,$fn=fn);
  translate([-radius,-radius,-radius])cube([radius*2,radius*2,radius]);
 }
}
module extension(hight,radius){
 cylinder(h=hight+0.1,r=radius,$fn=fn);
}

module extended_dome(hight,radius){
 extension(hight,radius);
 translate([0,0,hight])dome(radius);
}


module toppart(){
 difference(){
 extended_dome(toppart_extension,toppart_outterradius);
  translate([0,0,-1])extended_dome(toppart_extension,toppart_inerradius);
 }
}

toppart();



