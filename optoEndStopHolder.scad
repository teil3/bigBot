holeDistance=19;
holeThickness=3;
length=66;
width=17.5;

socketSlotWidth=6;
socketBorderWidth=4;
socketWidth=socketBorderWidth+socketBorderWidth+socketSlotWidth;

socketHeight=5;

m3ScrewRaduis=3.65/2;
m3NutHeight=2.5;

wallThickness = 6;

holder();

module holder(){
	difference(){
		union(){
			socket();
			translate([0,-(width-socketWidth)/2,socketHeight])optoSocket();
		}
		translate([45,1.8,0])screw3(10,30); 
		translate([45,socketWidth-1.8])screw3(10,30); 
		#translate([socketWidth/2,socketWidth/2,-1.29])m5Screw(socketHeight,6.3);
	}
}

module socket(){
	cube([socketWidth, socketWidth,  socketHeight]);
}

module optoSocket(){
	cube([length+socketWidth, width,  socketHeight]);
}

module screw3(screwLength=10, slotLength=10) {
	hull(){
		cylinder(h=screwLength, r=m3ScrewRaduis);
		#translate([slotLength,0,0])cylinder(h=screwLength, r=m3ScrewRaduis);
	}
	hull(){
		cylinder(h=socketHeight+m3NutHeight,r=6.9/2,$fn=6);
		translate([slotLength,0,0])cylinder(h=socketHeight+m3NutHeight,r=6.9/2,$fn=6);
		
	}
}

module m5Screw(h=10,headH=3) {
	union() {
		cylinder(h=h,r=3.4);
		translate([0,0,h])cylinder(h=headH,r=5);
	}
}
//nema17Width=42.30;
//slotWidth=4.5;
//slotHeight=0.6;
//
//difference(){
//	translate([-wallThickness,-(nema17Width-40)/2-wallThickness,-1])cube([40+wallThickness,nema17Width+(wallThickness*2),nema17Width+wallThickness+5]);
//	translate([0,-(nema17Width-40)/2,wallThickness+5])nema17Big();
//	translate([-100,0,-40])profile5_40x40(200);
//	rotate([0,0,90])translate([-100,-40,-40])profile5_40x40(200);
//	#translate([10,10,-slotHeight-0.1])m5Screw(6,6);
//	translate([10,30,-slotHeight-0.1])m5Screw(6,6);
//	translate([30,10,-slotHeight-0.1])m5Screw(6,6);
//	translate([30,30,-slotHeight-0.1])m5Screw(6,6);
//	translate([55,50,56])rotate([90,0,0])cylinder(h=60,r=50);
//}
//
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
//
//module m3Screw(h=10,headH=3) {
//	union() {
//		cylinder(h=h,r=1.7);
//		translate([0,0,h])cylinder(h=headH,r=5.65/2);
//	}
//}
//
//module m5Screw(h=10,headH=5.5) {
//	union() {
//		cylinder(h=h,r=2.5);
//		translate([0,0,h])cylinder(h=headH,r=4.25);
//	}
//}
//
//module profile5_20x20(l=100) {
//	difference(){
//		cube([l,20,20]);
//		translate([0,(20/2)-slotWidth/2,0])cube([l,slotWidth,slotHeight]);
//		translate([0,(20/2)-slotWidth/2,20-slotHeight])cube([l,slotWidth,slotHeight]);
//		translate([0,0,(20/2)-(slotWidth/2)])cube([l,slotHeight,slotWidth]);
//		translate([0,20-slotHeight,(20/2)-(slotWidth/2)])cube([l,slotHeight,slotWidth]);
//		
//	}
//	
//}
//
//module profile5_40x40(l=100) {
//	union(){
//		profile5_20x20(l);
//		translate([0,20,0])profile5_20x20(l);
//		translate([0,20,20])profile5_20x20(l);
//		translate([0,0,20])profile5_20x20(l);
//	}
//	
//}