use <Write.scad>

// condition text
txt="Disadvantage";

// number of times to print the text
num=2; // [0, 1, 2, 3, 4]

// circle accuracy
fn=200; // [100:255]

// ring height
ring_h=2.5;

// ring inner radius
ring_inner_radius=13;

// ring outter radius
ring_outter_radius=18;

// letter size
text_h=5;

// text height
text_t=2;

// text spacing
text_space=1.0;

/*
Notes:
Setting text_h<5 makes the next not being sliced correctly in simplify3d it seems
*/

module cr(conditiontext,num=3, ring_h = 2.5,ring_inner_radius=13, ring_outter_radius=18,text_h=5 , text_t=2, text_space=1){
    text_z_offset=text_t/2-0.1;
    text_z_position=ring_h+text_z_offset;
    text_radius=ring_inner_radius+((ring_outter_radius-ring_inner_radius)/2);
    difference(){
        cylinder(r=ring_outter_radius,h=ring_h,$fn=fn);
        translate([0,0,-1])cylinder(r=ring_inner_radius,h=ring_h+2,$fn=fn);
    }
    writecircle(text=conditiontext, t=text_t, where=[0,0,text_z_position], h=text_h,radius=text_radius,space=text_space);
    if(num>1){
        for(i=[1:num]){
            rotate([0,0,(360/num)*i])writecircle(text=conditiontext,t=text_t, where=[0,0,text_z_position], h=text_h,radius=text_radius,space=text_space);        
        }
    }
}



cr(txt,num,ring_h,ring_inner_radius,ring_outter_radius,text_h,text_t,text_space);
echo("Built ", txt, " with num=", num);


//cr("Hunter's Mark",2);
//cr("Poisoned",3);
//cr("Advantage",3);
//cr("Disadvantage",2);
//cr("Grappled");
//cr("Stunned");
//cr("Charmed");
//cr("Invisible",2);
//cr("Restrained",2);
