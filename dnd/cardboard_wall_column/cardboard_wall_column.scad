
base_grid_size=24;
colummn_ratio=0.8;

column_total_height=80; // 80: standard height for my 24mm tileset

column_type=2; // [1:Simple Rectangular,2:Simple Round]
build_object=2; // [1:Column,2:Cap, 3:Door Stick]

foundation_height=4;

bricks=true;
brick_height=column_total_height/9;
mortar_size=0.4;

fissure_width=2.5;
north_fissure=true;
east_fissure=true;
south_fissure=true;
west_fissure=true;
fn=250;

// cap variables
cap_height = 10;
cap_wall=1.5;
cap_wiggle_room=0.00;// not really needed

// door stick
stick_width=0.9*fissure_width;
stick_length=4*base_grid_size-1;

module pieSlice(a, r, h){
  // a:angle, r:radius, h:height
  rotate_extrude(angle=a) square([r,h]);
}


module cylinder_bricks(cylinder_radius){

    for(i=[0:brick_height:column_total_height-2]){
                   render()difference(){
                        translate([0,0,i])cylinder(h=mortar_size,r=cylinder_radius+1,center=true,$fn=fn);
                        translate([0,0,i])cylinder(h=mortar_size+0.1,r=cylinder_radius-mortar_size,center=true,$fn=fn);
                   }
                   start_offset = rands(0,40,1)[0];
                   for(mortar_angle=[0:40:360]){
                       render()rotate([0,0,start_offset+mortar_angle])difference(){
                           translate([0,0,i])pieSlice(1,cylinder_radius+mortar_size,brick_height-mortar_size);
                           translate([0,0,i])pieSlice(1,cylinder_radius-mortar_size,brick_height-mortar_size);
                       }
                   }
               }
  
}

module square_bricks(square_column_side){
       for(i=[0:brick_height:column_total_height-2]){
                   render()difference(){
                        translate([0,0,i])cube([square_column_side+mortar_size,square_column_side+mortar_size,mortar_size],center=true);
                        translate([0,0,i])cube([square_column_side-mortar_size,square_column_side-mortar_size,mortar_size],center=true);
                   }
               } 
}

module column(){
    if(column_type==1){
        square_column_side = base_grid_size *colummn_ratio;
        difference(){
            translate([0,0,column_total_height/2])cube([square_column_side,square_column_side,column_total_height],center=true);
            square_bricks(square_column_side);
        }
        translate([0,0,foundation_height/2])cube([base_grid_size,base_grid_size,foundation_height],center=true);
    }
    if(column_type==2){
        cylinder_radius = (base_grid_size *colummn_ratio)/2;
        difference(){
            translate([0,0,column_total_height/2])cylinder(h=column_total_height,r=cylinder_radius,center=true,$fn=fn);
            if(bricks){
               cylinder_bricks(cylinder_radius);
            }
        }
        
        translate([0,0,foundation_height/2])cylinder(h=foundation_height,r=base_grid_size/2,center=true,$fn=fn);
    }
}

module fissure(){
    translate([base_grid_size/4,0,column_total_height/2+1])cube([base_grid_size/2,fissure_width,column_total_height],center=true);
}

module cap(){
      if(column_type==1){
        square_column_side = base_grid_size *colummn_ratio;
       //todo.. cap for squared columns
    }
    if(column_type==2){
        cylinder_radius = (base_grid_size *colummn_ratio)/2;
        difference(){
            translate([0,0,cap_height/2])cylinder(h=cap_height,r=cylinder_radius+cap_wall+cap_wiggle_room,center=true,$fn=fn);
            translate([0,0,0])sphere(r=cylinder_radius+cap_wiggle_room,$fn=fn);
            translate([0,0,0.5])cylinder(h=1,r=cylinder_radius+cap_wiggle_room,center=true,$fn=fn);
        }

    }
}

module stick(){
    translate([0,0,stick_width/2])cube([stick_length,stick_width,stick_width],center=true);
}

// Build the column
if (build_object ==1 ) {
    difference(){
        column();
        if(north_fissure)rotate([0,0,90])fissure();
        if(east_fissure)rotate([0,0,0])fissure();
        if(south_fissure)rotate([0,0,-90])fissure();
        if(west_fissure)rotate([0,0,180])fissure();
    }
}
// Build the cap
if (build_object ==2 ) {
    difference(){
        cap();
        if(north_fissure)rotate([0,0,90])fissure();
        if(east_fissure)rotate([0,0,0])fissure();
        if(south_fissure)rotate([0,0,-90])fissure();
        if(west_fissure)rotate([0,0,180])fissure();
    }
}

// Build the door stick
if (build_object ==3 ) {
   stick();
}




