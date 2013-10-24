/* [Global] */

//which parts should be created
part = "bottom"; // [both:Bottom and Top,bottom:Bottom only,top:Top Only,closed:Closed case(for display only- not printable)]

/* [Ports] */
open_power_input=1; // [1:Open,0:Closed]
open_power_and_reset_button=1; // [1:Open,0:Closed]
open_micro_usb=1; // [1:Open,0:Closed]
open_hdmi=1; // [1:Open,0:Closed]
open_network=1; // [1:Open,0:Closed]
open_usb=1; // [1:Open,0:Closed]
open_audio=1; // [1:Open,0:Closed]
open_sd_slot=1; // [1:Open,0:Closed]

/* [Advanced] */
//add mouse ears to prevent warping
mouse_ear_radius=0; // [0:10]
circle_accuracy=50; // [25:200]
ground_height=2; // [1:5]
wall_width=2; // [1:5]

//additional wall height to mount the top
top_height=9;

//height of the four elevator sockets
elevator_width=6; // [1:10]
elevator_height=4; // [0:10]
//gap between board and wall
gap=3; // [0:10]



/* [Hidden] */
udoo_board_length=110;
udoo_board_width=86;
udoo_board_height=18;
//additional vertical offset for each hole ("baseline")
hole_vertical_offset=2;


/* derived vars */

total_ground_length=udoo_board_length+2*gap+2*wall_width;
total_ground_width=udoo_board_width+2*gap+2*wall_width;
wall_height=udoo_board_height+top_height;


module ground(){
 cube([total_ground_length,total_ground_width,ground_height]);
}

module long_wall(){
 cube([total_ground_length,wall_width,wall_height]);
}

module short_wall(){
 cube([wall_width,total_ground_width,wall_height]);
}

module all_walls(){
	ground();
	
	//long wall with all the connectors
	translate([0,0,ground_height]){
		long_wall();
	}
	
	
	//long wall wih the power input
	translate([0,total_ground_width-wall_width,ground_height]){
		long_wall();
	}
	
	//short wall with power button
	translate([0,0,ground_height]){
		short_wall();
	}
	
	//short wall with no holes
	translate([total_ground_length-wall_width,0,ground_height]){
		short_wall();
	}
}
module hole_in_long_wall_1(offset,width,height,voffset=0,type="cube"){
 translate([wall_width+gap+offset,-1,ground_height+elevator_height+hole_vertical_offset+voffset]){
   if (type=="cube"){
   	  cube([width,wall_width+2,height]);
   } else if (type=="cylinder") {
     translate([width/2,wall_width,height/2])rotate(a=90, v=[1,0,0])cylinder(h=wall_width+2,r=width/2,$fn=circle_accuracy,center=true);
   }
 }
}

module hole_in_long_wall_2(offset,width,height,voffset=0,type="cube"){
 translate([wall_width+gap+offset,total_ground_width-wall_width-1,ground_height+elevator_height+hole_vertical_offset+voffset]){
 if (type=="cube"){
   	  cube([width,wall_width+2,height]);
   } else if (type=="cylinder") {
     translate([width/2,wall_width,height/2])rotate(a=90, v=[1,0,0])cylinder(h=wall_width+2,r=width/2,$fn=circle_accuracy,center=true);
   }
 }
}

module hole_in_short_wall(offset,width,height,voffset=0){
 translate([-1,wall_width+gap+offset,ground_height+elevator_height+hole_vertical_offset+voffset]){
   cube([wall_width+2,width,height]);
 }
}


module hdmi(){
 hole_in_long_wall_1(34,15,7);
}

module micro_usb(){
 hole_in_long_wall_1(8,23,6,-2);
}

module network(){
 hole_in_long_wall_1(50,16,15);
}

module usb(){
 hole_in_long_wall_1(67,19,15);
}

module audio(){
 hole_in_long_wall_1(86.5,9,9,type="cylinder",voffset=3);
 hole_in_long_wall_1(96,9,9,type="cylinder",voffset=3);
}

module power_input(){
 hole_in_long_wall_2(5,10,10,voffset=2,type="cylinder");
}

module power_reset_button(){
 hole_in_short_wall(7,17,7);
}

module sd_slot(){
 hole_in_short_wall(34,13,4);
}

module elevators(){
 translate([wall_width+gap,wall_width+gap,ground_height])cube([elevator_width,elevator_width,elevator_height]);
 translate([total_ground_length-wall_width-gap-elevator_width,wall_width+gap,ground_height])cube([elevator_width,elevator_width,elevator_height]);
 translate([wall_width+gap,total_ground_width-wall_width-gap-elevator_width,ground_height])cube([elevator_width,elevator_width,elevator_height]);
 translate([total_ground_length-wall_width-gap-elevator_width,total_ground_width-wall_width-gap-elevator_width,ground_height])cube([elevator_width,elevator_width,elevator_height]);
}


module mouse_ears(){
 if (mouse_ear_radius > 0 ) {
  for (i = [0,total_ground_length]){
   for (j = [0,total_ground_width]){
		translate([i,j,0])cylinder(r=mouse_ear_radius,h=0.5,$fn=circle_accuracy);
   }
  }
   
 }
}
module udoo_case_bottom(){
 difference(){
	all_walls();

 /* long wall 1 holes */
  if (open_micro_usb==1){
	 micro_usb();
  }

   if (open_hdmi==1){
     hdmi();
   }

  if (open_network==1){
    network();
  }

  if (open_usb==1){
    usb();
  }

  if (open_audio==1){
    audio();
  }

 /* long wall 2 holes */
 if (open_power_input==1){
  power_input();
 }

 /* short wall holes */
 if (open_power_and_reset_button==1){
   power_reset_button();
 }

 if (open_sd_slot==1){
   sd_slot();
 }
 } // end of difference

 elevators();
 mouse_ears();

} // end of module udoo_case

module udoo_case_top(){
  //main plate
  cube([total_ground_length,total_ground_width,ground_height]);

  //frame
  translate([wall_width,wall_width,ground_height]) difference(){
  cube([total_ground_length-2*wall_width,total_ground_width-2*wall_width,ground_height]);
  translate([1,1,1])cube([total_ground_length-2*wall_width-2,total_ground_width-2*wall_width-2,ground_height]);
  }
}

if (part=="both"){
 translate([0,-total_ground_width/2,0]){
   udoo_case_bottom();
    //Test holes here
   // hole_in_long_wall_1(87,19,14,type="cylinder");
 }
 translate([-total_ground_length-2,-total_ground_width/2,0])udoo_case_top();
} else if (part=="bottom"){
 translate([-total_ground_length/2,-total_ground_width/2,0])udoo_case_bottom();
} else if (part=="top") {
  translate([-total_ground_length/2,-total_ground_width/2,0])udoo_case_top();
} else if (part=="closed"){
  translate([-total_ground_length/2,-total_ground_width/2,0])udoo_case_bottom();
  translate([-total_ground_length/2,total_ground_width/2,0])translate([0,0,2*ground_height+wall_height])rotate([180,0,0]) udoo_case_top();
}


//TODO: top holes (black ports, sata, )
//TODO: screw holes (top)

//Nice to have
//TODO: Text on walls / top ?
//TODO: 2.5'' drive case on top?
