

//bottom part: inside
//top part outside
bottompart_outterradius=13;
wall=1.5;

fn=100;
part="bottom" ; //'closed' or 'top' or 'bottom' or 'both'

bottompart_extension=10;
toppart_tip_radius=bottompart_outterradius/8;
toppart_tip_hight=bottompart_outterradius/2;
toppart_extension=10;
bottompart_tip_radius=bottompart_outterradius/3;
bottompart_tip_hight=bottompart_outterradius/3;



bottompart_inerradius=bottompart_outterradius-wall;
toppart_inerradius=bottompart_outterradius+0.5;
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
module bottompart_tip(){
 cylinder(h=bottompart_tip_hight,r1=bottompart_tip_radius,r2=0.2,$fn=fn);
}

module extended_dome(hight,radius){
 extension(hight,radius);
 translate([0,0,hight])dome(radius);
}

module bottompart(){
  difference(){
    extended_dome(bottompart_extension,bottompart_outterradius);
    translate([0,0,-1])extended_dome(bottompart_extension,bottompart_inerradius);
  }

  translate([0,0,bottompart_extension+bottompart_outterradius-2])bottompart_tip();
}


module toppart(){
 difference(){
 extended_dome(toppart_extension,toppart_outterradius);
  translate([0,0,-1])extended_dome(toppart_extension,toppart_inerradius);
 }

 //toppart tip
 translate([0,0,toppart_extension+toppart_outterradius-wall])cylinder(h=toppart_tip_hight,r=toppart_tip_radius,$fn=fn);
}

//main
if(part=="bottom" || part=="both"){
bottompart();
}

if (part=="top" || part=="both"){
translate([-3*bottompart_outterradius,0,0])toppart();
}

//closed acorn
if (part=="closed"){
 toppart();
 rotate([0,180,0])bottompart();
}

