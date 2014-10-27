igloo_inner_radius=20;
/* [Hidden] */
wall_thickness=1;
igloo_outter_radius=igloo_inner_radius+wall_thickness;
brick_cutout=0.1;
num_bricks_vertical=6;
//vertical_degrees_per_brick=90/num_bricks_vertical;
brick_height=igloo_outter_radius/num_bricks_vertical;
fn=250;


door_length=igloo_inner_radius/3;
door_height=igloo_inner_radius/1.5;

door_width=door_height/1.5;

//source: http://www.thefrankes.com/wp/?p=2660
module arc( height, depth, radius, degrees ) {
    // This dies a horible death if it's not rendered here
    // -- sucks up all memory and spins out of control
    render() {
        difference() {
            // Outer ring
            rotate_extrude($fn = fn)
                translate([radius - height, 0, 0])
                    square([height,depth]);
         
            // Cut half off
            translate([0,-(radius+1),-.5])
                cube ([radius+1,(radius+1)*2,depth+1]);
         
            // Cover the other half as necessary
            rotate([0,0,180-degrees])
            translate([0,-(radius+1),-.5])
                cube ([radius+1,(radius+1)*2,depth+1]);
         
        }
    }
}


module cutoff(){
//cut off lower half
 translate([-igloo_outter_radius*2,-igloo_outter_radius*2,-igloo_outter_radius*2]){
   cube([igloo_outter_radius*4,igloo_outter_radius*4,igloo_outter_radius*2]);
 }
}

module dome(inner_radius,outter_radius){
 difference(){
  sphere(outter_radius,$fn=fn);
   translate([0,0,-0.1]){
    sphere(inner_radius,$fn=fn);
   }
  cutoff();
 }
}

module horizontal_brick_lines(){
difference(){
 dome(igloo_inner_radius+wall_thickness/2,igloo_outter_radius+wall_thickness);
 for ( i = [0 : num_bricks_vertical-1] ){
    translate([-igloo_outter_radius*2,-igloo_outter_radius*2,i*brick_height])cube([igloo_outter_radius*4,igloo_outter_radius*4,brick_height-brick_cutout]);
 }

 }


}

module vertical_brick_line(rotate_ground,rotate_up,arcdeg){
  rotate([-rotate_up,0,rotate_ground]){
  rotate([0,90,0]){
   arc(brick_cutout+2,brick_cutout,igloo_outter_radius+2,arcdeg);
  }
 }
}

module vertical_brick_lines(){

//level1
for(i=[0:18]){
 vertical_brick_line(i*20,0,9.5);
}

//level2
for(i=[0:20]){
 vertical_brick_line(i*18+7,9,10);
}

//level3
for(i=[0:15]){
 vertical_brick_line(i*24+4,19,11);
}

//level4
for(i=[0:14]){
 vertical_brick_line(i*25,30,12);
}

//level5
for(i=[0:14]){
 vertical_brick_line(i*25+7,42,14);
}

//roof
for(i=[0:10]){
 vertical_brick_line(i*36+2,56,35);
}

}

module main_dome(){
 difference(){
  dome(igloo_inner_radius,igloo_outter_radius);
  horizontal_brick_lines();
  vertical_brick_lines();
 }
}


main_dome();
//horizontal_brick_lines();
//vertical_brick_lines();
//vertical_brick_line(45,45);

module door(){
 translate([0,0,door_height-door_width]){
 rotate([0,90,0]){
 hull(){
  cylinder(h=door_length,r=door_width/2,$fn=fn);
  translate([-door_width+door_height,-door_width/2,0])cube([0.1,door_width,door_length]);
 }
 }
 }
}
translate([igloo_inner_radius,0,0])door();

