BASE_SIZE=28; // 28mm models
MODULE_HEIGHT=BASE_SIZE; 
FLOOR_THICKNESS=3;
FLOOR_WALL=2;
SPACE=0.1;
PILLAR_SIDE=BASE_SIZE/8;


module pillar(side=PILLAR_SIDE,unit=BASE_SIZE,height=MODULE_HEIGHT){
    tick_height=0.2;
    difference(){
    cube([side,side,height]);
    if(height>unit){
        for(i=[0:unit:height]){
            translate([-0.1,side-(side/10),i])cube([side+0.3,(side/10)*2,tick_height]);
        }
    }
    }
    
}

module platform(width=BASE_SIZE,length=BASE_SIZE,floor_height=FLOOR_THICKNESS,height=BASE_SIZE,floor_wall=FLOOR_WALL,pillar_side=PILLAR_SIDE){
    
    //FLOOR
    difference(){
        cube([width,length,floor_height]);
        translate([floor_wall,-floor_wall,-0.1])cube([width-floor_wall*2,length+floor_wall*3,floor_height-floor_wall+0.1]);
    }
    
    
    // Pillar
    translate([pillar_side,0,floor_height])pillar(side=pillar_side,height=height-floor_height);
    translate([width-pillar_side*2,0,floor_height])pillar(side=pillar_side,height=height-floor_height);
    
    // ROOF
    translate([pillar_side-floor_wall+SPACE*2,0,height])cube([width-(floor_wall+SPACE)*2,length-(floor_wall+SPACE)*2,floor_height-floor_wall]);
}


units=1;

rotate([90,0,0])platform(height=BASE_SIZE*units);
