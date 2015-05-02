h=10;
r=40;
w=2;
circleacc=80;
numcuts=50;
eyer=8;
eyeposup=10;
eyedist=15;
eyewall=1;

module circlewall(radius,wall){
  difference(){
	 cylinder(h=h,r=radius,$fn=circleacc);
   translate([0,0,-1])cylinder(h=h+2,r=radius-wall,$fn=circleacc);
 }
}

module bigbase(){
 difference(){
  circlewall(r,w);
  for (i=[0:numcuts]){
    rotate([0,0,i*360/numcuts])translate([r-3.8,0,-1])cylinder(h=h+2,r=3,$fn=circleacc);
  }
 }
}

module eyes(){
 translate([eyedist,eyeposup,0])circlewall(eyer,eyewall);
 translate([-eyedist,eyeposup,0])circlewall(eyer,eyewall);
}

module _mouth(r1,r2,t,h){
  difference(){
  cylinder(h=h,r=r1,$fn=circleacc);
  translate([0,t,-1])cylinder(h=h+2,r=r2,$fn=circleacc);
  }
}
module mouth(){
  m1=27;
  m2=29;
  offset=12;
 difference(){
  _mouth(m1,m2,offset,h);
 translate([0,0,-1])_mouth(m1-0.5,m2+0.5,offset,h+2);
 }
}
module holder(){
 translate([-r,eyeposup-eyer/2,0])cube([2*r,eyer,0.3]);
 translate([-4,-r,0])cube([8,2*r,0.3]);
}

bigbase();
//eyes();
//translate([0,-1,0])mouth();
//holder();
