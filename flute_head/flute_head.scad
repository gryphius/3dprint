total_length=215;
inner_length=170;
outter_diameter=20;
wall=1.5;

lip_piece_length=45;
lip_piece_thickness=3;
lip_hole_distance=65;
lip_hole_radius_inner=9;
lip_hole_radius_outter=3;
lip_hole_width=7;



/* [Hidden] */
circle_points=350;


/* derived */
outter_radius=outter_diameter/2;
inner_radius=outter_radius-wall;
lip_piece_width=2*outter_radius+2*lip_piece_thickness;

module main_cylinder(){
/* * MAIN CYLINDER * */
 difference(){
  //outter cylinder
  cylinder(h=total_length,r=outter_radius,$fn=circle_points);
  //inner cylinder
  translate([0,0,total_length-inner_length]){
   cylinder(h=inner_length+1,r=inner_radius,$fn=circle_points);
  }
 }
}



/* * LIP PIECE * */
module lip_piece(){



 difference(){

   // cube
	translate([-lip_piece_width/2,0,0]){
    cube([lip_piece_width,outter_radius+lip_piece_thickness,lip_piece_length]);
  }

  //inner cylinder (="outter main cylinder")
  translate([0,0,-1]){  
    cylinder(h=total_length,r=outter_radius,$fn=circle_points);
  
  //outter cylinder
    difference(){
       cylinder(h=total_length,r=outter_radius+lip_piece_thickness*3,$fn=circle_points);
       cylinder(h=total_length,r=outter_radius+lip_piece_thickness,$fn=circle_points);
    } //of difference
  }//of translate


//cut off mouthpiece so we don't get overhang
translate([outter_radius,-outter_radius,-1]){  
 rotate([0,0,45]){
 cube([outter_radius*2,outter_radius,total_length]);
 }
}

translate([-outter_radius*2,0,-1]){  
 rotate([0,0,-45]){
 cube([outter_radius*2,outter_radius,total_length]);
 }
}


 } //of difference

}

/* * LIP HOLE * */

module lip_hole(){
rotate([0,90,90]){  
 hull(){
   cylinder(r1=lip_hole_radius_inner,r2=lip_hole_radius_outter,h=wall+lip_piece_thickness+3,$fn=circle_points);
   translate([lip_hole_width-lip_hole_radius_outter,0,0]){
     cylinder(r1=lip_hole_radius_inner,r2=lip_hole_radius_outter,h=wall+lip_piece_thickness+3,$fn=circle_points);
  }
 }
}

}


module flute_head(){
translate([0,0,outter_radius]){
rotate([90,0,90]){
difference(){
 union(){
  main_cylinder();
  translate([0,0,lip_hole_distance-lip_piece_length/2]){
    lip_piece();
  }
 } //of union
 translate([0,inner_radius-2,lip_hole_distance+lip_hole_width/4]){
  lip_hole();
 }
} //diference

} //rotate
}
}
//main program

difference(){
flute_head();

//build plate
translate([-1,-outter_radius,0]){
 cube([total_length+2,outter_diameter,0.3]);
}

}

/**   test print
 total_length=80;
 inner_length=70;
 main_cylinder();
}

**/