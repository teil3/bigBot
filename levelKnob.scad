knobHeight=8;
numberOfGrips=10;
gripRadius=knobHeight;
knobRadius=50/2;

hubRadius=10/2;

hubHeight=2;


knob();

module knob(){
	difference(){
		union() {
			grip();
			translate([0,0,-knobHeight/2])cylinder(h=knobHeight, r=knobRadius);
			#translate([0,0,knobHeight/2])cylinder(h=hubHeight, r=hubRadius);
		}
		difference(){
			#translate([0,0,knobHeight/2])cylinder(h=knobHeight*2, r=knobRadius*2);
			translate([0,0,knobHeight/2])cylinder(h=hubHeight, r=hubRadius);
		}
		translate([0,0,-(knobHeight*2)-knobHeight/2])cylinder(h=knobHeight*2, r=knobRadius*2);
		#translate([0,0,-knobHeight/2])m5Screw();
	}
}

module grip(){
	for ( i = [0 : numberOfGrips] )
	{
	    rotate( i * 360 / numberOfGrips+1, [0, 0, 1])
	    translate([0, knobRadius, 0])
//	    sphere(r = gripRadius, $fn=15);
	    cube([gripRadius,gripRadius,gripRadius],center=true);
	}
}

module m5Screw(h=15) {
	union() {
		translate([0,0,5])cylinder(h=h+5,r=5.6/2);
//		cylinder(h=5,r=3.6/2);
//		#translate([0,0,h-0.4])cylinder(h=5.5,r=6.3/2);
		translate([0,0,-0.1])cylinder(h=5.5,r=9.9/2,$fn=6);
	}
}