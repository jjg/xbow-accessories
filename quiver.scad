bolt_shaft_diameter = 6.3;
bolt_shaft_length = 150;
bolt_capacity = 4;
shaft_clip_width = 10;

// shaft clip
difference(){
	cube([shaft_clip_width,(bolt_shaft_diameter*2)*bolt_capacity,bolt_shaft_diameter * 3]);

	for(yt = [0:bolt_capacity-1]){
		translate([-1,((bolt_shaft_diameter*yt)*2) + bolt_shaft_diameter,bolt_shaft_diameter*2]){
			rotate([0,90,0]){
				#cylinder(r=bolt_shaft_diameter/2,h=shaft_clip_width+2);
			}
		}
	}
}

// tip holder

// bridge
