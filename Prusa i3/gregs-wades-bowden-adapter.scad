//gregs_wades_spacing bottom 50mm
//gregs_wades_spacing side 26.5mm
// prusa i3 z-axis 20mm





difference()
{
	translate([14, 20, 0]) cylinder(h = 14, r = 35, center = true);

	translate([0, 46, -8]) cylinder(h = 5, r = 2);

	translate([18, 0, 0]) cylinder(h = 8, r = 1.5);
	translate([38, 0, 0]) cylinder(h = 8, r = 1.5);
	
	translate([-11, 20, 2]) cube([50, 80, 11], center = true);
	translate([0, 4.5, 3]) rotate([0, 90, 0]) cylinder(h = 40, r = 1.5);
	translate([0, 34, 3]) rotate([0, 90, 0]) cylinder(h = 40, r = 1.5);

	translate([20, 4.5, 3]) rotate([0, 90, 0]) cylinder(h = 40, r = 3);
	translate([20, 34, 3]) rotate([0, 90, 0]) cylinder(h = 40, r = 3);

	translate([0, 21, -8]) cylinder(h = 6, r = 13);
}







