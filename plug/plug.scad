plug_height=10;
plug_radius_small=10;
plug_radius_big=12;
lid_height=2;
lid_radius=14;
fn=120;

cylinder(r=lid_radius,h=lid_height,$fn=fn);

translate([0,0,lid_height])cylinder(r1=plug_radius_big,r2=plug_radius_small,h=plug_height,$fn=fn);


