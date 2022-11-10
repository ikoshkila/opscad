translate([0,0,1030])
rotate([0,180,0])
for(z=[-150,150]){
    for(i=[0:12:360]){
        rotate([0,0,i])
        linear_extrude(height = 1000, twist = z, slices = 25, scale = 3)
        translate([200,0,0])rotate([0,70,0])circle(r=10);
    }
}
difference(){
cylinder(r=610,h=30);
translate([-100,0,26])
scale([10,10,1])
linear_extrude(height=10,center = true)
text("1561");
}
translate([0,0,1000*cos(20)+60])
difference(){
     cylinder(r=205,h=30);
    translate([0,0,-3])
    cylinder(r=195,h = 30+5);
}

