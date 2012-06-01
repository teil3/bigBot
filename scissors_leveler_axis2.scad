//include <bearing.scad>;
//include <screw.scad>;

profileWidth = 20;
screwSpace = 15;
thickness = 10;

mainBoreDiameter = 16;
mainBoreRadius = mainBoreDiameter/2;

axisDiameter = 9;
axisRadius = axisDiameter/2;

profileHeight=20;
slotWidth=5;
slotHeight=6.35;


difference () {
	getMain();
//	translate([0,0,0])bearing(model=625);
//	translate([0,0,2])bearing(model=625);
//	translate([0,0,0])cylinder(h=5,r=8.2);
//	translate([(profileWidth+screwSpace)/2,0,-10])m5Screw();
//	translate([-(profileWidth+screwSpace)/2,0,-10])m5Screw();
//	translate([0,0,-thickness/2])cylinder(h=thickness*2,r=4);
}
module getMain() {
	difference() {
		union() {
//			translate([0,0,1.75])
			cylinder(h=profileHeight/2,r=mainBoreRadius);
			translate([-(mainBoreDiameter*2)/2,-slotWidth/2,0])cube([mainBoreDiameter*2,slotWidth,slotHeight]);
		}
		axis();
//		#translate([0,0,13])
		#bearing();
	}
}

module axis() {
	cylinder(h=profileHeight,r=axisRadius);
}

module bearing() {
	cylinder(h=5,r=13.4/2);
}


module m5Screw() {
	union() {
		cylinder(h=10,r=2.5);
		translate([0,0,10])cylinder(h=5,r=4.25);
	}
}

