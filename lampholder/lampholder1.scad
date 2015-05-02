//noch messen
kugelradius=250/2;
kugelhoehe=214;
dachhoehe=50;

//fix
glaslochradius=123/2;
dachradius=135/2;
kugeldicke=5;
halterkurz=84.0/2.0;
halterlang=109.0/2.0;

ringdicke=5;
ringkurz=95/2; //weniger als halterlang
ringlang=170/2; //etwas mehr als glasloch (123)
ringbreite=15.0;

fn=200;

dichterdicke=2;

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
 difference(){
  translate([0,0,-kugelradius+dachhoehe])sphere(r=kugelradius,$fn=fn);
  translate([0,0,-kugelradius+dachhoehe])sphere(r=kugelradius-5,$fn=fn);
  translate([-kugelradius,-kugelradius,-kugelradius*2])cube([kugelradius*2,kugelradius*2,kugelradius*2]);
 }

 //color("black")cylinder(h=1,r=dachradius,$fn=fn);
}

module ausschnitt(){
 color("blue")cylinder(h=1,r=glaslochradius);
}

//ausblenden
//%translate([0,0,ringdicke])dach();
%rotate([0,0,90])translate([0,0,-ringdicke])halter();
%translate([0,0,-ringdicke])halter();
//%translate([0,0,kugelradius-kugelhoehe+ringdicke*2])glas();
//%translate([0,0,ringdicke])ausschnitt();


module _oval(k,l,h){
 scale (v=[l/k,1,1]) cylinder(h = h, r=k,$fn=fn);
}

module oval(){
difference(){
_oval(ringkurz+ringbreite/2,ringlang+ringbreite/2,ringdicke);
translate([0,0,-1])_oval(ringkurz,ringlang,ringdicke+2);
translate([0,0,kugelradius-kugelhoehe+ringdicke*2])glas();
}
}


module ring(){
difference(){
 cylinder(r=glaslochradius+kugeldicke,h=dichterdicke,$fn=fn);
 translate([0,0,-1])cylinder(r=glaslochradius-1,h=dichterdicke+2,$fn=fn);
 }
}

//oval();
ring();




//halter test
//%translate([-109/2,-84/2,0])cube([109,84,5]);




