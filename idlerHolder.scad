wallThickness = 6;

nema17Width=42.30;
slotWidth=4.5;
slotHeight=0.6;

difference(){
	#translate([-wallThickness,0,-1])cube([15,40,30]);
	#translate([-20,20,20])rotate([0,90,0])cylinder(h=100,r=5.5);//nema17Big();
	#translate([-6.5,20,20])rotate([0,90,0])cylinder(h=6,r=8.2);//nema17Big();
	#translate([-100,0,-40])profile5_40x40(200);
	#rotate([0,0,90])translate([-100,-40,-40])profile5_40x40(200);
	translate([3,10,-slotHeight-0.1])m5Screw(25,40);
	translate([3,30,-slotHeight-0.1])m5Screw(25,40);
//	translate([30,10,-slotHeight-0.1])m3Screw(2.8,40);
//	translate([30,30,-slotHeight-0.1])m3Screw(2.8,40);
//	translate([55,50,56])rotate([90,0,0])cylinder(h=60,r=50);
}

//module nema17Big(){
//	union(){
//		cube([60,nema17Width,nema17Width]);
//		translate([0,nema17Width/2,nema17Width/2])rotate([0,-90,0])cylinder(h=22,r=6/2);
//		translate([0.1,nema17Width/2,nema17Width/2])rotate([0,-90,0])cylinder(h=0.2+wallThickness,r=22.5/2);
//		translate([0.1,5.5,5.5])rotate([0,-90,0])m3Screw(5.5,40);
//		translate([0.1,nema17Width-5.5,5.5])rotate([0,-90,0])m3Screw(5.5,40);
//		translate([0.1,5.5,nema17Width-5.5])rotate([0,-90,0])m3Screw(5.5,40);
//		translate([0.1,nema17Width-5.5,nema17Width-5.5])rotate([0,-90,0])m3Screw(5.5,40);
//	}
//}

//module m3Screw(h=10,headH=3) {
//	union() {
//		cylinder(h=h,r=1.7);
//		translate([0,0,h])cylinder(h=headH,r=5.65/2);
//	}
//}

module m5Screw(h=10,headH=3) {
	union() {
		cylinder(h=h,r=3.4);
		translate([0,0,h])cylinder(h=headH,r=5);
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