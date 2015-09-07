design_version = "V2";
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
					cylinder(r=(bolt_shaft_diameter*1.1)/2,h=shaft_clip_width+2,$fn=50);
				}
			}
		}
	}

	// tip holder
	translate([bolt_shaft_length/2,0,0]){
		difference(){
			cube([shaft_clip_width*3,(bolt_shaft_diameter*2)*bolt_capacity,bolt_shaft_diameter * 3]);

			for(yt = [0:bolt_capacity-1]){
				translate([4,((bolt_shaft_diameter*yt)*2) + bolt_shaft_diameter,bolt_shaft_diameter*1.7]){
					rotate([0,90,0]){
						// tip
						cylinder(r1=(bolt_shaft_diameter*1.1)/2,r2=.5,h=shaft_clip_width*2,$fn=50);
						// shaft
						translate([0,0,-shaft_clip_width-1.9]){
							cylinder(r=(bolt_shaft_diameter*1.1)/2,h=shaft_clip_width+2,$fn=50);
						}
					}
				}
			}
			
			// watermark
			translate([10,((bolt_shaft_diameter*2)*bolt_capacity)/2-(bolt_capacity),bolt_shaft_diameter*2.3]){
				rotate([90,0,0]){
					rotate([0,90,0]){
						linear_extrude(height = 10){
						   text(design_version,size=4);
						}
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