
base_grid_size=24;

column_total_height=80; // 80: standard height for my 24mm tileset

column_type=2; // [1:Simple Rectangular,2:Simple Round]

foundation_height=2;

bricks=true;
brick_height=column_total_height/9;
mortar_size=0.4;

fissure_width=3;
north_fissure=true;
east_fissure=true;
south_fissure=true;
west_fissure=true;
fn=250;

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
                   start_offset = rands(0,60,1)[0];
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
        square_column_side = base_grid_size *0.8;
        difference(){
            translate([0,0,column_total_height/2])cube([square_column_side,square_column_side,column_total_height],center=true);
            square_bricks(square_column_side);
        }
        translate([0,0,foundation_height/2])cube([base_grid_size,base_grid_size,foundation_height],center=true);
    }
    if(column_type==2){
        cylinder_radius = (base_grid_size *0.8)/2;
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


difference(){
    column();
    if(north_fissure)rotate([0,0,90])fissure();
    if(east_fissure)rotate([0,0,0])fissure();
    if(south_fissure)rotate([0,0,-90])fissure();
    if(west_fissure)rotate([0,0,180])fissure();
}





