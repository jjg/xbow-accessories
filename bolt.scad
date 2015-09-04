shaft_diameter = 5;
shaft_length = 110;
fletching_length = 50;
fletching_width = 15;
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
		translate([-fletching_width/2,-(shaft_diameter/10)/2,fletching_length/6]){
			cube([fletching_width,shaft_diameter/10, fletching_length/3]);
		}
	}
}