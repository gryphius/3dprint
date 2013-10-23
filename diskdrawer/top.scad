wall_floor=3;
height=90;
total_width=150;
total_length=189;

difference(){
cube([total_width,total_length,height]);

  translate([wall_floor,wall_floor,wall_floor]){
    cube([90,183,height]);
  }

  translate([2*wall_floor+90,wall_floor,wall_floor]){
    cube([50,183,height]);
  }

}

