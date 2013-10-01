

module jhead()
{
	translate([0, 20, -21])
	difference()
	{
		cylinder(51, 8, 8);
		jhead_collar();
	}
}

module jhead_collar()
{
		translate([0, 0, 41.7]) 
		difference()
		{
			cylinder(4.5, 8, 8);
			cylinder(4.5, 6, 6);
		}
		
}

module 3mm_screws()
{
	translate([21/2, 0, 28]) 3mm_screw();
	translate([-21/2, 0, 28]) 3mm_screw();
}

module 3mm_screw()
{
	translate([0, 48, 0])
	rotate([90, 0, 0])
	cylinder(50, 1.5, 1.5);
}

module extruder_block()
{
	translate([0, 20, 33]) cylinder(5, 9, 9);
	difference()
	{
		translate([0, 40/2, 33/2]) cube([33, 40, 33], center = true);
		translate([0, 35/2+6, 21/2]) cube([21, 35, 21], center = true);
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

module extruder_block_front()
{
	difference()
	{
		extruder_block();
		translate([0, -5, 50/2]) cube(50, center = true);
	}	
}

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

module compression_fitting()
{
	translate([0, 20, 30]) cylinder(20, 5, 5);
}


andrews_bowden_extruder();