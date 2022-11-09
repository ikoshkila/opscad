module koleso(poli){
  union(){
    color(c = "#bfbfbfff")
    scale([1,0.8,0.8])
    intersection(){
      scale([0.6,1,1])
      sphere(12, $fn=poli);
      sphere(9, $fn=poli);
    }
    color(c = "#303030ff")
    rotate([90,0,0])
    scale([1,1,0.85])
    rotate_extrude(convexity = 10, $fn=poli)
    translate([7,0,0])
    scale([0.6,1,1])
    circle(7, $fn=poli);
  }
}
module glasok(poli){
difference(){
  union(){
    color(c="#ff3434ff")
    translate([-0.8,0,0])scale([0.3,1,1.05])
    sphere(5.3, $fn = poli);
    color(c="#f0f0f0ff")
    scale([0.3,1,1.05])
    sphere(5, $fn = poli);
  }
  color(c="#775fa5ff")
  translate([1.4,0,0])scale([0.1,1,1.05])
  sphere(2, $fn = poli);
}
}

module wing (poli){
rotate([0,0,10])
union(){
difference(){
    difference(){
        translate([27,18.5,9])
        rotate([0,0,-10])
        translate([-5.5,0,0])
        cube([31,1,20],center = true);       rotate([0,5,-10])
        translate([0,20,17.5])
        cube([40,10,10]);
    }
    translate([22,20,0])
    rotate([90,0,-10])
    cylinder(30,14.9,14.9, center = true, $fn = poli);

}

// front smooth
translate([35.9,12.3,-1])
rotate([0,0,-10])
scale([0.8,1,0.8])
    rotate([90,0,0])
    sphere(5, $fn = poli);


// front smooth
translate([36,12.3,14.5])
rotate([0,0,-10])
intersection(){
    scale([0.8,1,0.8])
    rotate([90,0,0])
    sphere(5, $fn = poli);
    translate([0,-7,0])
    cube([5,14,5]);
}

// smooth above wheel
translate([36,12.3,14.5])
rotate([-85,0,80])
scale([1,0.8,1])
cylinder(31,5,5, $fn = poli);

// front smooth
translate([36,12.3,6.75])
rotate([0,0,80])
scale([1,0.8,1])
cylinder(15.5,5,5, center = true, $fn = poli);

// circle arround wheel
intersection(){
    translate([21,15,0])
    rotate([90,0,-10])
    rotate_extrude(convexity = 10, $fn=poli)
    translate([15,0,0])
    scale([0.8,1,1])
    circle(5, $fn=poli);
    translate([20,15,9])
    scale([1,1,0.5])
    cube(40,center = true);
}

// smooth around door
intersection(){
    translate([6.3,17.59,-1.05])
    rotate([90,0,-10])
    scale([0.8,0.8,1])
    sphere(5, $fn = poli);
    translate([9,0,-3.5])
    cube([5,45.18,5], center = true);
}
}
}

module hood(poli){
difference(){
    
    rotate([0,5.1,0])
    translate([-10.625,0,0])
    cube([40,50,0.5],center = true);
    translate([0,19,0])
    rotate([0,5,-10])
    translate([-10,5,0])
    cube([50,20,1],center = true);
    translate([0,-24,0])
    rotate([0,5,10])
    translate([-10,0,0])
    cube([50,20,1],center = true);
}
}


poli = 50;

// wheels
translate([22,-18,0])rotate([0,0,0])//-5
koleso(poli);
translate([22,18,0])rotate([0,0,0])//10
koleso(poli)
translate([-22,18,0])rotate([0,0,0])//-10
koleso(poli);
translate([-22,-18,0])
koleso(poli);

// eyes
translate([34,12,22])rotate([0,0,2])
rotate([-7,0,0])
translate([0,0,1])
glasok(poli);
translate([34,-12,22])rotate([0,0,-2])
rotate([7,0,0])
translate([0,0,1])
glasok(poli);

// mouth
color(c="#f0f0f0ff")
translate([32,0,8])
rotate([0,10,0])
sphere(9, $fn = poli);

//windows
color("#303030ff")
translate([-5,0,19])
scale([1.01,1,1])
intersection(){
intersection(){
    difference(){
        scale([1.3,1,1.1])
        sphere(22.7, $fn = poli);
        translate([0,0,-15])
        cube([60,60,30],center = true);
    }
    translate([0,0,-3])
    scale([1.3,1.1,1])
    sphere(25, $fn = poli);
}
intersection(){
intersection(){
    translate([0,0,9])
    cube([60,33,13],center=true);
    translate([0,0,-39])
    scale([1,0.9,1.4])
    rotate([90,0,90])
    cylinder(60,40,40, $fn = poli);
}
translate([0,0,-32])
scale([1,0.6,1.4])
rotate([90,0,90])
cylinder(60,40,40, $fn = poli);
}
}

color("#303030ff")
translate([-5,0,19])
scale([1,1.01,1])
intersection(){
intersection(){
    difference(){
        scale([1.3,1,1.1])
        sphere(22.7, $fn = poli);
        translate([0,0,-15])
        cube([60,60,30],center = true);
    }
    translate([0,0,-3])
    scale([1.3,1.1,1])
    sphere(25, $fn = poli);
}
rotate([0,0,90])
intersection(){
    translate([0,0,9])
    cube([60,25,13],center=true);
    translate([0,0,-39])
    scale([1,0.7,1.4])
    rotate([90,0,90])
    cylinder(60,40,40, $fn = poli, center = true);
}
}

color(c = "#ff3434ff")
union(){
// wings arround wheels
rotate([0,0,-10])
wing(poli);

mirror([0,1,0])
rotate([0,0,-10])
wing(poli);

mirror([1,0,0])
rotate([0,0,-10])
wing(poli);

mirror([0,1,0])
mirror([1,0,0])
rotate([0,0,-10])
wing(poli);

// main cube (doors)
translate([0,0,8.25])
cube([13,45.2,18.25], center = true);

// front and back hood
translate([27,0,19.05])
hood(poli);

mirror([1,0,0])
translate([27,0,19.05])
hood(poli);

// head
translate([-5,0,19])
intersection(){
    difference(){
        scale([1.3,1,1.1])
        sphere(22.7, $fn = poli*2);
        translate([0,0,-15])
        cube([60,60,30],center = true);
    }
    translate([0,0,-3])
    scale([1.3,1.1,1])
    sphere(25, $fn = poli*2);
}

// smooth around front case
translate([36.05,0,14.5])
rotate([90,0,0])
scale([0.8,0.8,1])
cylinder(25,5,5, center = true, $fn = poli);

translate([36.05,0,-1])
rotate([90,0,0])
scale([0.8,0.8,1])
cylinder(25,5,5, center = true, $fn = poli);

// smooth around back case
translate([-36.05,0,-1])
rotate([90,0,0])
scale([0.8,0.8,1])
cylinder(25,5,5, center = true, $fn = poli);

translate([-36.05,0,14.5])
rotate([90,0,0])
scale([0.8,0.8,1])
cylinder(25,5,5, center = true, $fn = poli);

// back case
translate([-39.8,0,6.75])
rotate([90,0,90])
cube([25,15.5,0.5], center = true);

// lip
difference(){
    translate([36.05,0,-1])
    rotate([90,0,0])
    scale([0.8,1.5,1])
    cylinder(25,5,5, center = true, $fn = poli);
    translate([36.05,0,-6])
    cube([10,40,10],center = true);
}


// lip
translate([17,0,25.6])
rotate([0,30,0])
intersection(){
    rotate_extrude(convexity = 10, $fn=poli)
    translate([25,0,0])
    circle(3, $fn=poli);
    translate([27,0,0])
    cube([8,27,20], center = true);
}

// smooths under doors
translate([0,17.59,-1.05])
rotate([90,0,90])
scale([1,0.8,1])
cylinder(13,5,5, center = true, $fn = poli);

translate([0,-17.59,-1.05])
rotate([90,0,90])
scale([1,0.8,1])
cylinder(13,5,5, center = true, $fn = poli);

// smooths above doors
translate([0,17.59,17.2])
rotate([90,0,90])
scale([1,0.8,1])
cylinder(13,5,5, center = true, $fn = poli);

translate([0,-17.59,17.2])
rotate([90,0,90])
scale([1,0.8,1])
cylinder(13,5,5, center = true, $fn = poli);

}

// axis
color("#303030ff")
translate([22,0,0])
rotate([90,0,0])
cylinder(25,1.5,1.5,$fn = poli, center = true);

color("#303030ff")
translate([-22,0,0])
rotate([90,0,0])
cylinder(25,1.5,1.5,$fn = poli, center = true);
