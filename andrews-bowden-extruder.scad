
// This is the final J-Head model
module jhead()
{
	translate([0, 20, -21])
	difference()
	{
		cylinder(51, 8, 8);
		jhead_collar();
	}
}

// This created the inset near the top of theJ-Head
module jhead_collar()
{
		translate([0, 0, 41.7]) 
		difference()
		{
			cylinder(4.5, 8, 8);
			cylinder(4.5, 6, 6);
		}
		
}

// This provides a set of screws with the heads at the correct location
// for the prusa3 vanilla x-carraiage
module 3mm_screws()
{
	translate([21/2, -13, 28]) 3mm_screw();
	translate([-21/2, -13, 28]) 3mm_screw();
}

// A single screw with head
module 3mm_screw()
{
	translate([0, 48, 0])
	rotate([90, 0, 0])
	cylinder(50, 1.5, 1.5);
	translate([0, 54, 0]) rotate([90, 0, 0]) cylinder(6,3,3);
}

// This represents the compression fitting and is subtracted from the
// extruder block to allow a place for it. 
module compression_fitting()
{
	translate([0, 20, 30]) cylinder(20, 5, 5);
}

// This is the base of the extruder it is split into two parts front and back
// the general shape. 
module extruder_block()
{
	// Support for the compression fitting exceeding the top of the extruder
	translate([0, 20, 33]) cylinder(5, 9, 9);
	// A slope to help with printing
	translate([0, 20, 33]) cylinder(5, 14, 9);
	difference()
	{
		translate([0, 40/2, 33/2]) cube([33, 40, 33], center = true);
		translate([0, 35/2+6, 21/2]) cube([29, 35, 21], center = true);
		translate([0, sqrt(45*45 + 45*45)/2, -10]) rotate([-60, 0, 0]) cube(45, center = true);
	}
}


module extruder_block_back()
{
	difference()
	{
		extruder_block();
		translate([0, 45, 50/2]) cube(50, center = true);
	}	
}

// Takes the extruder block and lops off the back half.
module extruder_block_front()
{
	difference()
	{
		extruder_block();
		translate([0, -5, 50/2]) cube(50, center = true);
	}	
}

// Put all the pieces together. 
module andrews_bowden_extruder()
{
	difference()
	{
		extruder_block_back();
		3mm_screws();
		jhead();
		compression_fitting();
	}
	

	difference()
	{
		extruder_block_front();
		3mm_screws();
		jhead();
		compression_fitting();
	}
	
}




andrews_bowden_extruder();