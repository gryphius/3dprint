fn=200;

module adapter(){
difference(){
union(){
cylinder(r=72/2,h=10,$fn=fn);
cylinder(r=43/2,h=50,$fn=fn);
//stuetze
translate([0,0,9.9])cylinder(r1=72/2,r2=43/2,h=8,$fn=fn);
}
translate([0,0,-0.1])cylinder(r=68.5/2,h=5.1,$fn=fn);
translate([0,0,-0.1])cylinder(r=38.5/2,h=80,$fn=fn);
}
}

translate([0,0,50])rotate([180,0,0])adapter();


