/* [Global] */
length=180;
width=110;
height=20;
rows=2;
compartments_per_row=3;
distance_to_wall=5;
distance_between_compartments=5;

/* [Hidden] */
fn=300;

cylinder_height=(length-(distance_to_wall*2)-((compartments_per_row-1)*distance_between_compartments))/compartments_per_row;
cylinder_radius=((width- (distance_to_wall*2)-((rows                -1)*distance_between_compartments))/rows)/2;
vertical_offset= (cylinder_radius>(height-distance_to_wall) ? cylinder_radius+distance_to_wall : height);



translate([-length/2,-width/2,0]){ //move the whole object to center of build platform
 difference(){
  //main cube
  cube([length,width,height]);   //main cube

  translate([0,cylinder_radius,vertical_offset]){ //move all cylinders
   for(rownum = [0:rows-1]){
    translate([0,distance_to_wall+rownum*(cylinder_radius*2+distance_between_compartments),0]){
     for(compnum = [0:compartments_per_row-1]){
      translate([ distance_to_wall+compnum*(cylinder_height+distance_between_compartments) ,0,0]){
       rotate([0,90,0]){
        cylinder(h=cylinder_height,r=cylinder_radius,$fn=fn);
       } //rotate
      } //translate
     } //for
    } //translate
   } //for
  } //translate
 } //difference
} //translate
