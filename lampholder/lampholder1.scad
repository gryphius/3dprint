kugelradius=80;
glaslochradius=127/2;
kugelhoehe=140;
dachradius=135/2;
kugeldicke=3;
halterkurz=84.0/2.0;
halterlang=109.0/2.0;

ringdicke=5;
ringkurz=100/2; //weniger als halterlang
ringlang=130/2; //etwas mehr als glasloch (123)
ringbreite=5.0;

module halter(){
 scale (v=[halterkurz/halterlang,1,1]) cylinder(h = ringdicke, r=halterkurz,$fn=200);
}

module glas(){
 difference(){
 sphere(r=kugelradius,$fn=200);
 sphere(r=kugelradius-kugeldicke,$fn=200);
 translate([-kugelradius,-kugelradius,kugelhoehe-kugelradius])cube([kugelradius*2,kugelradius*2,kugelradius*2]);
 }
 
}

module dach(){
 cylinder(h=7,r=dachradius,$fn=200);
}


%translate([0,0,ringdicke+10])dach();
%translate([0,0,-ringdicke])halter();
%translate([0,0,kugelradius-kugelhoehe+ringdicke])glas();


module oval(){
difference(){
scale (v=[1,ringkurz/ringlang,1]) cylinder(h = ringdicke, r=ringkurz,$fn=200);
translate([0,0,-1])scale (v=[1,((ringkurz-ringbreite)/2)/((ringlang-ringbreite)/2),1]) cylinder(h = ringdicke+2, r=ringkurz-ringbreite,$fn=200);
}
}


oval();







