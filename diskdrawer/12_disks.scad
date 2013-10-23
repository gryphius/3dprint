wall_floor=3;
drawer_length=90;
drawer_width=20;

rows=6;
columns=2;

height=90;

total_width=(rows+1)*wall_floor+(rows*drawer_width);
total_length=(columns+1)*wall_floor+(columns*drawer_length);


echo("length=", total_length, " and width=", total_width);


difference(){
cube([total_width,total_length,height]);

for ( r = [0 : rows-1] ){
  for ( c = [0 : columns-1] ){
     translate([wall_floor+r*(wall_floor+drawer_width),wall_floor+c*(wall_floor+drawer_length),wall_floor]){
		cube([drawer_width,drawer_length,height]);
	  }
  }

}
}

