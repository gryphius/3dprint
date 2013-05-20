/*
d power eins breiter
d ir eins weiter nach hinten
d sd 2 weiter
d audio 1 weiter
d usb 1 breiter
d hdmi eins breiter
- power chord 1 weiter
*/

//board: 8x11cm, +0.5 border

TOTAL_GROUND_LENGTH=124;
TOTAL_GROUND_WIDTH=90;
BORDER_WIDTH=5;
BORDER_HEIGHT=30; //including ground
GROUND_HEIGHT=1;

INNER_FLOOR_LENGTH=TOTAL_GROUND_LENGTH-2*BORDER_WIDTH;
INNER_FLOOR_WIDTH=TOTAL_GROUND_WIDTH-2*BORDER_WIDTH;

ELEVATOR_HEIGHT=2;
CORNER_LENGTH=7;

FLOOR_HOLE_WIDTH=5;
FLOOR_HOLE_LENGTH=60;



//ground floor - holes
difference(){
 cube([TOTAL_GROUND_LENGTH,TOTAL_GROUND_WIDTH,GROUND_HEIGHT]);

 for( i= [15:15:TOTAL_GROUND_LENGTH-15]){
  translate([i,TOTAL_GROUND_WIDTH/2-FLOOR_HOLE_LENGTH/2,-1]){
   cube([FLOOR_HOLE_WIDTH,FLOOR_HOLE_LENGTH,GROUND_HEIGHT+2]);
  }
 }
}
//long border 1 (with many connectors)
difference(){
 cube([TOTAL_GROUND_LENGTH,BORDER_WIDTH,BORDER_HEIGHT]);

 //audio jacks
 translate([9,-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([32,10,8]);
 }

 //USB
 translate([44,-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([17,10,21.5]);
 }

 //hdmi, network
 translate([64,-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([38,10,15]);
 }

 //power supply
 translate([105,-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([10,10,10]);
 }

 //sliding hole 
 translate([-1,BORDER_WIDTH/2,BORDER_HEIGHT-5]){
cube([TOTAL_GROUND_LENGTH-BORDER_WIDTH/2,TOTAL_GROUND_WIDTH-BORDER_WIDTH,3]);
}

}

//long border 2 (IR, power)
difference(){
 translate([0,85,0]){
  cube([TOTAL_GROUND_LENGTH,BORDER_WIDTH,BORDER_HEIGHT]);
 }

 //power button
 translate([92,TOTAL_GROUND_WIDTH-BORDER_WIDTH-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([11,10,5]);
 }

 //IR receiver
 translate([56,TOTAL_GROUND_WIDTH-BORDER_WIDTH-1,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
  cube([10,10,5]);
 }


  //sliding hole 
 translate([-1,BORDER_WIDTH/2,BORDER_HEIGHT-5]){
cube([TOTAL_GROUND_LENGTH-BORDER_WIDTH/2,TOTAL_GROUND_WIDTH-BORDER_WIDTH,3]);
}
}

//short border1  (SD card slot)
difference(){
  cube([BORDER_WIDTH,TOTAL_GROUND_WIDTH,BORDER_HEIGHT-5]);
  
  //SD Card slot
  translate([-1,32,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
   cube([8,31,5]);
  }
}

//short border 2 small connector
difference(){
 translate([TOTAL_GROUND_LENGTH-BORDER_WIDTH,0,0]){
  cube([BORDER_WIDTH,90,BORDER_HEIGHT]);
 }

   //white connector
  translate([TOTAL_GROUND_LENGTH-BORDER_WIDTH-1,33,GROUND_HEIGHT+ELEVATOR_HEIGHT]){
   cube([8,10,5]);
  }


  //sliding hole 
 translate([-1,BORDER_WIDTH/2,BORDER_HEIGHT-5]){
cube([TOTAL_GROUND_LENGTH-BORDER_WIDTH/2,TOTAL_GROUND_WIDTH-BORDER_WIDTH,3]);
}
}

//corners
 translate([BORDER_WIDTH,BORDER_WIDTH,GROUND_HEIGHT]){
   cube([CORNER_LENGTH,CORNER_LENGTH,2]);
 }

 translate([BORDER_WIDTH+INNER_FLOOR_LENGTH-CORNER_LENGTH,BORDER_WIDTH,GROUND_HEIGHT]){
   cube([CORNER_LENGTH,CORNER_LENGTH,2]);
 }
 translate([BORDER_WIDTH+INNER_FLOOR_LENGTH-CORNER_LENGTH,BORDER_WIDTH+INNER_FLOOR_WIDTH-CORNER_LENGTH,GROUND_HEIGHT]){
   cube([CORNER_LENGTH,CORNER_LENGTH,2]);
 }
 translate([BORDER_WIDTH,BORDER_WIDTH+INNER_FLOOR_WIDTH-CORNER_LENGTH,GROUND_HEIGHT]){
   cube([CORNER_LENGTH,CORNER_LENGTH,2]);
 }


//Antenna
difference(){
 translate([TOTAL_GROUND_LENGTH-BORDER_WIDTH-25,TOTAL_GROUND_WIDTH-BORDER_WIDTH-5,BORDER_HEIGHT-15]){
  cube([29,9,5]);
 }
 
  translate([TOTAL_GROUND_LENGTH-BORDER_WIDTH-26,TOTAL_GROUND_WIDTH-BORDER_WIDTH-4,BORDER_HEIGHT-14]){
  cube([29,7,3]);
 }
}
