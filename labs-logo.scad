// labs.leap.io logo
// Copyright (c) 2015 by Johannes Winkelmann, johannes@leap.io

$fn = 100;

module shape1(alpha=1) {
    
    sphere_radius = 10;
    sphere_cutoff = 3;
    neck_height = 15;
    neck_radius = 3;
    
    translate([0, 0, (sphere_radius-sphere_cutoff)]) {
        %difference() {
            union() {
                sphere(r = sphere_radius);
                translate([0,0,sphere_radius-1]) {
                    cylinder(r = neck_radius, h=neck_height);
                }
                translate([0, 0, neck_height+sphere_radius]) {
                    rotate_extrude(convexity = 10, $fn = 100)
                        translate([neck_radius, 0, 0])
                            circle(r = 1, $fn = 100);    
                }
            }
            translate([0, 0, -sphere_radius*2+sphere_cutoff]) {
                cube([sphere_radius*2, sphere_radius*2, sphere_radius*2], center=true);
            }
        }
        
        color([0,1,0,alpha])
        difference() {
            sphere(r = sphere_radius-1);
            translate([0, 0, -sphere_radius*2+sphere_cutoff+1]) {
                cube([sphere_radius*2, sphere_radius*2, sphere_radius*2], center=true);
            }
            
            translate([0, 0, 10]) {
                cube([sphere_radius*2, sphere_radius*2, sphere_radius*2], center=true);
            }

        }
    }
}

module shape2(alpha=1) {
    
    cylinder_height = 15;
    cylinder_width = 12;
    neck_height = 15;
    neck_radius = 3;
    
    %translate([0, 0, 1]) {
        translate([0, 0, 0.5]) {
            cylinder(r1 = cylinder_width, r2 = neck_radius, h=cylinder_height);
            
            translate([0,0,cylinder_height-1]) {
                cylinder(r = neck_radius, h=neck_height);
            }
            translate([0, 0, neck_height+cylinder_height]) {
                rotate_extrude(convexity = 10, $fn = 100)
                    translate([neck_radius, 0, 0])
                        circle(r = 1, $fn = 100);    
            }
        }
        
        rotate_extrude(convexity = 10, $fn = 100)
                translate([cylinder_width-1, 0, 0])
                    circle(r = 1, $fn = 100); 
    }
    
    color([1,0,0,alpha])
    difference() {
        cylinder(r1 = cylinder_width-1, r2 = neck_radius-1, h=cylinder_height);
        translate([0, 0, -cylinder_width/2+1]) {
            cube([cylinder_width*2, cylinder_width*2, cylinder_width], center=true);
        }
        translate([0, 0, 15]) {
            cube([cylinder_width*2, cylinder_width*2, cylinder_width], center=true);
        }

    }
}

translate([30, 30, 0]) {
    shape1();
    translate([40, 0, 0]) {
        shape2();
    }
}

// color([0.1, 0.1, 0.1, 0.2])
    //cube([100, 100, 1]);