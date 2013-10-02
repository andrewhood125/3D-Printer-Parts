// Rambo 90 degree mount for Prusa i3
// Andrew Hood <andrewhood125@gmail.com>
// Based on:  http://www.thingiverse.com/thing:98280
// RAMBo adapter for RAMPS mounting holes

module rampshole() {
	difference() {
		cylinder(r=8.5/2, h=2, center=true, $fn=30);
		cylinder(r=8.2/4, h=3, center=true, $fn=30);
	}
}

module ramboholes() {
	difference() {
		cylinder(r=7/2, h=7, center=true, $fn=30);
		cylinder(r=7/4, h=8, center=true, $fn=30);
	}
}

module rambopegs() {
	union() {
		translate([95/2, 96/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([95/2, -96/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([-95/2, 96/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
		translate([-95/2, -96/2, 0]) {
			ramboholes();
			translate([0,0,-2.5]) cylinder(r=11/2, h=4, center=true);
		}
	}
}

module ramboframe() {
	translate([102/2,0,-2.5]) cube(size=[25,106, 4], center=true);
	translate([-102/2,0,-2.5]) cube(size=[4,96, 4], center=true);
	translate([0,103/2,-2.5]) cube(size=[96,4, 4], center=true);
	translate([0,-103/2,-2.5]) cube(size=[96,4, 4], center=true);
	translate([102/3,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([-102/3,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([102/5,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([-102/5,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([102/16,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([-102/16,0,-2.5]) cube(size=[4,100, 4], center=true);
	translate([0,103/20,-2.5]) cube(size=[100,4, 4], center=true);
}

module rampsholes() {
	translate([550*0.0254+1.5, 100*0.0254, -2.5]) rampshole();
	translate([3800*0.0254, 100*0.0254, -2.5]) rampshole();
	translate([600*0.0254, 2000*0.0254, -2.5]) rampshole();
	translate([3550*0.0254, 2000*0.0254, -2.5]) rampshole();
}

module arduino()
{
	translate([119/2, -114/2, -1]) rotate([90, 0, 90]) {
		difference() {
			// the arduino cube
			cube([114, 53, 4]);
			translate([13.97, 2.54, -1]) cylinder(6, 1.5);
			translate([15.24, 50.8, -1]) cylinder(6, 1.5);
			translate([90.17, 50.8, -1]) cylinder(6, 1.5);
			translate([96.52, 2.54, -1]) cylinder(6, 1.5);
		}
	}
}

module mountBraces()
{
	 rotate([90, -90, 0]) {
		translate([-4.5, -127/2, -110/2])
		linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
		polygon(points=[[0,0],[53,0],[0,53]]);
		
		translate([-4.5, -127/2, 110/2])
		linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
		polygon(points=[[0,0],[53,0],[0,53]]);
	}
}

module rambo()
{
	rambopegs();
	ramboframe();
}



rambo();
arduino();
mountBraces();
