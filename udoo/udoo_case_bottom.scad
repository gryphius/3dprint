/* [Global] */

//which parts should be created
part = "both"; // [both:Bottom and Top,bottom:Bottom only,top:Top Only,closed:Closed case(for display only- not printable)]

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
ground_height=2; // [1:5]
wall_width=3; // [1:5]

//additional wall height to mount the top
top_height=9;

//height of the four elevator sockets
elevator_width=6; // [1:10]
elevator_height=4; // [0:10]
//gap between board and wall
gap=3; // [0:10]

//additional vertical offset for each hole
hole_vertical_offset=2;

/* [Hidden] */
udoo_board_length=110;
udoo_board_width=86;
udoo_board_height=18;

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
module hole_in_long_wall_1(offset,width,height){
 translate([wall_width+gap+offset,-1,ground_height+elevator_height+hole_vertical_offset]){
   cube([width,wall_width+2,height]);
 }
}

module hole_in_long_wall_2(offset,width,height){
 translate([wall_width+gap+offset,total_ground_width-wall_width-1,ground_height+elevator_height+hole_vertical_offset]){
   cube([width,wall_width+2,height]);
 }
}

module hole_in_short_wall(offset,width,height){
 translate([-1,wall_width+gap+offset,ground_height+elevator_height+hole_vertical_offset]){
   cube([wall_width+2,width,height]);
 }
}


module hdmi(){
 hole_in_long_wall_1(33,20,9);
}

module micro_usb(){
 hole_in_long_wall_1(8,23,6);
}

module network(){
 hole_in_long_wall_1(50,20,15);
}

module usb(){
 hole_in_long_wall_1(65,19,15);
}

module audio(){
 hole_in_long_wall_1(83,19,14);
}

module power_input(){
 hole_in_long_wall_2(4,8,8);
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
 
} // end of module udoo_case

module udoo_case_top(){
  cube([total_ground_length,total_ground_width,ground_height]);
  translate([wall_width,wall_width,ground_height])cube([total_ground_length-2*wall_width,total_ground_width-2*wall_width,ground_height]);
}

if (part=="both"){
 translate([0,-total_ground_width/2,0])udoo_case_bottom();
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
//TODO: use cylinders for audio/power input/elevator?
//TODO: screw holes (top)

//Nice to have
//TODO: Text on walls / top ?
//TODO: 2.5'' drive case on top?
