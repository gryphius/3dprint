l=40;
w=26;
h=40;

wall=2;

difference(){
cube([l,w,h]);
translate([wall,wall,wall])cube([l-2*wall,w-2*wall,h]);
}