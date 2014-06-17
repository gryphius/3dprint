// from http://www.snb.ch/de/iabout/cash/id/cash_coins
diameters=[31.45, 27.40, 23.20, 18.20, 21.05, 19.15, 17.15 ];
heights=[2.35, 2.15, 1.55, 1.25, 1.65, 1.45, 1.25];

num_coins = 7;

circle_accuracy=100;

//extra diameter for the coin to slide
extradiameter=1;


height=70;
wall=3;
width=7*diameters[0]+2*wall;
depth=30;

echo("width=",width," depth=",depth," height=",height);

module coinholder(){
  difference(){
	 cube([width,depth,height]);
	 for(i=[0:6]){
	  translate([wall+diameters[0]/2+i*diameters[0],diameters[i]/3,wall]){
	    cylinder(r=(diameters[i]+extradiameter)/2,h=height,$fn=circle_accuracy);
    }
   }



	//slots to pull out
	for(i=[0:6]){
    hull(){
    translate([wall+diameters[0]/2+i*diameters[0],diameters[i]/3,wall]){
	    cylinder(r=(diameters[i]+extradiameter)/2,h=heights[i]+1,$fn=circle_accuracy);
    }
	  translate([wall+diameters[0]/2+i*diameters[0],0,wall]){
	    cylinder(r=(diameters[i]+extradiameter)/2,h=heights[i]+1,$fn=circle_accuracy);
    }
    }
   }

 }//end of difference
  
}

module foot(){
 cube([5,depth,16]);
}

translate([0,0,15]){
 coinholder();
}
foot();
translate([width-5,0,0]){
 foot();
}
//