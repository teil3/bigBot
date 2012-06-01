wallThickness = 6;

nema17Width=42.30;
slotWidth=4.5;
slotHeight=0.6;

nutDiameter=23;
nutRaduis=nutDiameter/2;
bearingDiameter=28;
bearingRadius=bearingDiameter/2;
bearingThickness=8;

difference(){
	translate([-wallThickness,-(nema17Width-40)/2-wallThickness,-1])cube([40+wallThickness,nema17Width+(wallThickness*2),nema17Width+wallThickness+5]);
	translate([0,-(nema17Width-40)/2,wallThickness+5])bigBearing();
	translate([-100,0,-40])profile5_40x40(200);
	rotate([0,0,90])translate([-100,-40,-40])profile5_40x40(200);
	translate([13,10,-slotHeight-0.1])m5Screw(6,6);
	#translate([13,30,-slotHeight-0.1])m5Screw(6,6);
	translate([33,10,-slotHeight-0.1])m5Screw(6,6);
	translate([33,30,-slotHeight-0.1])m5Screw(6,6);
	translate([50+bearingThickness,50,56])rotate([90,0,0])cylinder(h=60,r=50);
}

module bigBearing(){
	union(){
		translate([bearingThickness,0,0])cube([60,nema17Width,nema17Width]);
		translate([0,nema17Width/2,nema17Width/2])rotate([0,-90,0])cylinder(h=22,r=6/2);
		translate([bearingThickness+0.1,nema17Width/2,nema17Width/2])rotate([0,-90,0])cylinder(h=0.2+wallThickness+bearingThickness,r=nutRaduis);
		translate([bearingThickness+0.1,nema17Width/2,nema17Width/2])rotate([0,-90,0])cylinder(h=0.2+bearingThickness,r=bearingRadius);
		translate([0.1+bearingThickness,5.5,5.5])rotate([0,-90,0])m3Screw(5.5+bearingThickness,40);
		translate([0.1+bearingThickness,nema17Width-5.5,5.5])rotate([0,-90,0])m3Screw(5.5+bearingThickness,40);
		translate([0.1+bearingThickness,5.5,nema17Width-5.5])rotate([0,-90,0])m3Screw(5.5+bearingThickness,40);
		translate([0.1+bearingThickness,nema17Width-5.5,nema17Width-5.5])rotate([0,-90,0])m3Screw(5.5+bearingThickness,40);
	}
}

module m3Screw(h=10,headH=3) {
	union() {
		cylinder(h=h,r=1.7);
		translate([0,0,h])cylinder(h=headH,r=5.65/2);
	}
}

module m5Screw(h=10,headH=5.5) {
	union() {
		cylinder(h=h,r=2.5);
		translate([0,0,h])cylinder(h=headH,r=4.25);
	}
}

module profile5_20x20(l=100) {
	difference(){
		cube([l,20,20]);
		translate([0,(20/2)-slotWidth/2,0])cube([l,slotWidth,slotHeight]);
		translate([0,(20/2)-slotWidth/2,20-slotHeight])cube([l,slotWidth,slotHeight]);
		translate([0,0,(20/2)-(slotWidth/2)])cube([l,slotHeight,slotWidth]);
		translate([0,20-slotHeight,(20/2)-(slotWidth/2)])cube([l,slotHeight,slotWidth]);
		
	}
	
}

module profile5_40x40(l=100) {
	union(){
		profile5_20x20(l);
		translate([0,20,0])profile5_20x20(l);
		translate([0,20,20])profile5_20x20(l);
		translate([0,0,20])profile5_20x20(l);
	}
	
}