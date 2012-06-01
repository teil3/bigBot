head_diameter=18;
head_radius=head_diameter/2;
head_thickness=8;
head_lever_length=36-head_radius;
flat_width=2;

bar_diameter=9.5;
bar_radiusr=bar_diameter/2;
bar_length=26;

head();
translate([0,20,0])rotate([0,90,0])
bar();

module head(){
	difference(){
		hull(){
			
			cylinder(h=head_thickness, r=head_radius);
			#translate([head_lever_length,-head_radius+flat_width,0])cube([1,1,head_thickness]);
		}
		#translate([-head_radius,-(head_diameter+head_radius)+flat_width,0])cube([head_diameter*2,head_diameter,head_thickness]);
		#translate([0,2.5,0])cylinder(h=bar_length,r=bar_radiusr+0.5);
	}
}

module bar(){
	difference(){
		translate([-bar_radiusr+2,0,0])cylinder(h=bar_length,r=bar_radiusr);

		translate([0,-bar_radiusr,0])cube([bar_diameter,bar_diameter,bar_length]);
		translate([0,0,5])rotate([0,90,180])#m4Screw();
		translate([0,0,bar_length-5])rotate([0,90,180])#m4Screw();
	}
}

module m4Screw(h=15) {
	union() {
		translate([0,0,3.0])cylinder(h=h+3.3,r=4.5/2);
//		cylinder(h=5,r=3.6/2);
//		#translate([0,0,h-0.4])cylinder(h=5.5,r=6.3/2);
		translate([0,0,-0.1])cylinder(h=3.3,r=8.8/2,$fn=6);
	}
}