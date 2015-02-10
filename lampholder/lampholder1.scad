//noch messen
kugelradius=80;
kugelhoehe=130;

//fix
glaslochradius=123/2;
dachradius=135/2;
kugeldicke=3;
halterkurz=84.0/2.0;
halterlang=109.0/2.0;

ringdicke=5;
ringkurz=100/2; //weniger als halterlang
ringlang=130/2; //etwas mehr als glasloch (123)
ringbreite=5.0;

fn=100;

module halter(){
 scale (v=[halterlang/halterkurz,1,1]) cylinder(h = ringdicke, r=halterkurz,$fn=fn);
}

module glas(){
 difference(){
 sphere(r=kugelradius,$fn=fn);
 sphere(r=kugelradius-kugeldicke,$fn=fn);
 translate([-kugelradius,-kugelradius,kugelhoehe-kugelradius])cube([kugelradius*2,kugelradius*2,kugelradius*2]);
 }
 
}

module dach(){
 cylinder(h=7,r=dachradius,$fn=fn);
}

module ausschnitt(){
 color("blue")cylinder(h=1,r=glaslochradius);
}

%translate([0,0,ringdicke+10])dach();
%rotate([0,0,90])translate([0,0,-ringdicke])halter();
%translate([0,0,kugelradius-kugelhoehe+ringdicke*2])glas();
//%translate([0,0,ringdicke])ausschnitt();


module _oval(k,l,h){
 scale (v=[l/k,1,1]) cylinder(h = h, r=k,$fn=fn);
}

module oval(){
difference(){
_oval(ringkurz,ringlang,ringdicke);
translate([0,0,-1])_oval(ringkurz-ringbreite/2,ringlang-ringbreite/2,ringdicke+2);
translate([0,0,kugelradius-kugelhoehe+ringdicke*2])glas();
}
}


oval();


//halter test
//%translate([-109/2,-84/2,0])cube([109,84,5]);




