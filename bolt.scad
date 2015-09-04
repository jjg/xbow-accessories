shaft_diameter = 6.3;
shaft_length = 150;
fletching_length = 65;
fletching_width = 16.68;
fletching_depth = .75;
point_length = 8;

// shaft
cylinder(r=shaft_diameter/2,h=shaft_length, $fn=25);

// tip
translate([0,0,shaft_length]){
	cylinder(r1=shaft_diameter/2, r2=.1, h=point_length, $fn=25);
}

// fletching
translate([0,0,5]){
	hull(){
		cylinder(r=shaft_diameter/4, h=fletching_length, $fn=25);	
		translate([-fletching_width/2,-(fletching_depth)/2,fletching_length/6]){
			cube([fletching_width,fletching_depth, fletching_length/3]);
		}
	}
}