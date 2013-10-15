
module fan_bracket()
{
	// Imagine these values looking straight at the piece while
	// it is laying on it's back for print. 
	fan_base_width = 33;
	fan_base_length = 6;
	fan_base_height = 6;

	fan_bracket_base_fancy(fan_base_width, fan_base_length, fan_base_height);
	
	translate([-21, -fan_base_length/2-0.2, fan_base_length/2-fan_base_height/2]) rotate([90, 0, 30])  
	{
		fan_bracket_wing(fan_base_width, fan_base_length, fan_base_height, -3, -7, 0);
	}
	translate([21, -fan_base_length/2-0.2, fan_base_length/2-fan_base_height/2]) rotate([90, 0, -30])  
	{
		fan_bracket_wing(fan_base_width, fan_base_length, fan_base_height, 3, 1, -6);
	}
	
}

module fan_bracket_wing(fan_base_width, fan_base_length, fan_base_height, hole_offset, cube_offset, filler)
{
	difference()
	{
		union()
		{
			fan_bracket_base(fan_base_width/4, fan_base_length, fan_base_height);
			translate([cube_offset, -3, -3]) cube([6,3,6]);
			translate([filler, -3, -3]) cube([6,6,6]);
		}
		translate([hole_offset, 0, 0]) rotate([180, 0, 0]) screw();
	}
	
}

module fan_bracket_base(fan_base_width, fan_base_length, fan_base_height )
{
	// Combine the cylinders on the end with the rectangle in the middle
	union()
	{
		// The cube of the base
		translate([-fan_base_width/2,- fan_base_length/2,  -fan_base_height/2 ]) 
		{
			cube([fan_base_width,  fan_base_length, fan_base_height]);
		}

		// Round corners on the base
		translate([-fan_base_width/2, 0, 0])  cylinder(r=fan_base_length/2,h=fan_base_height,center=true,$fn=30);
		translate([fan_base_width/2, 0, 0])  cylinder(r=fan_base_length/2,h=fan_base_height,center=true,$fn=30);
	}
}

module fan_bracket_base_fancy(fan_base_width, fan_base_length, fan_base_height)
{
	cutout_radius = 32;
	// Create the base and cut out part on top and bottom

	difference()
	{	
		fan_bracket_base(fan_base_width, fan_base_length, fan_base_height);
		translate([0, cutout_radius+1, 0]) cylinder(r=cutout_radius, h=10,center=true,$fn=100);
		translate([0, -cutout_radius-1, 0]) cylinder(r=cutout_radius, h=10,center=true,$fn=100);
		
	}	
}

// A single 3mm screw
module screw() 
{
	union()
	{	
		translate([0, 0, 2]) cylinder(r=2.5,h=4, center=true,$fn=30);
		cylinder(r=1.5,h=10,center=true,$fn=30);
	}
	
}

// Two screws spaced 30mm apart
module attatchment_screws()
{
	rotate([0,0,0])
	{
		translate([15,0,0]) screw();
		translate([-15,0,0]) screw();
	}
}


// Used to render the stl for print
module print()
{
	difference()
	{
		fan_bracket();
		attatchment_screws();
	}
}


print();
