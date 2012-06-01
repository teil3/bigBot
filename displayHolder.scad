length = 45;
thickness=25;
height=27;

slotWidth=4.5;
slotHeight=0.6;

difference(){
	cube([thickness,length,height]);
	#translate([17.5,length-7.5,height+0.1])rotate([180,0,0])m5ScrewNut(10,40);
	translate([7.5,-0.1,10])rotate([270,0,0])m5Screw(6.5,40);
}


module m5Screw(h=10,headH=3) {
	union() {
		cylinder(h=h,r=3.4);
		translate([0,0,h])cylinder(h=headH,r=5);
	}
}

module m5ScrewNut(h=10,headH=3) {
	union() {
		translate([0,0,0])cylinder(h=h,r=3.4);
		translate([0,0,h])cylinder(h=headH,r=9.6/2,$fn=6);
	}
}

