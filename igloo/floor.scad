//floor for http://www.thingiverse.com/thing:25933

//measured with 500% scaled model
diameter=73;
door_width=16;
floor_height=0.4;
wall_height=4;
door_height=20;
fn=200;

difference(){
cylinder(r=diameter/2,h=wall_height,$fn=fn);
translate([0,0,floor_height])cylinder(r=diameter/2-0.2,h=wall_height,$fn=fn);
}

translate([-door_width/2,diameter/2-1,0])cube([door_width,0.2,door_height]);
//translate([-door_width/2+1,diameter/2-1,0])cube([door_width-2,5,0.2]);
