bolt_shaft_diameter = 6.3;
bolt_shaft_length = 150;
bolt_capacity = 3;
shaft_clip_width = 5;

union(){
	// shaft clip
	difference(){
		cube([shaft_clip_width,(bolt_shaft_diameter*2)*bolt_capacity,bolt_shaft_diameter * 2]);

		for(yt = [0:bolt_capacity-1]){
			translate([-1,((bolt_shaft_diameter*yt)*2) + bolt_shaft_diameter,bolt_shaft_diameter*1.7]){
				rotate([0,90,0]){
					cylinder(r=bolt_shaft_diameter/2,h=shaft_clip_width+2,$fn=25);
				}
			}
		}
	}

	// tip holder
	translate([bolt_shaft_length/2,0,0]){
		difference(){
			cube([shaft_clip_width*2,(bolt_shaft_diameter*2)*bolt_capacity,bolt_shaft_diameter * 3]);

			for(yt = [0:bolt_capacity-1]){
				translate([-1,((bolt_shaft_diameter*yt)*2) + bolt_shaft_diameter,bolt_shaft_diameter*1.7]){
					rotate([0,90,0]){
						cylinder(r1=bolt_shaft_diameter/2,r2=.5,h=shaft_clip_width*2,$fn=25);
					}
				}
			}
		}
	}

	// bridge
	translate([0,((bolt_shaft_diameter*2)*bolt_capacity)/2-(bolt_capacity),0]){
		cube([bolt_shaft_length/2,bolt_capacity*2,bolt_shaft_diameter]);
	}
}