//include <bearing.scad>;
//include <screw.scad>;

wheelDiameter=77.5;
wheelRadius=wheelDiameter/2;
clearance=0.15;
//profileWidth = 20+(clearance*2);
profileWidth = 20;
screwSpace = 15;
wallThickness = 5;
bockLength=60;

ballNutRadius=22/2;
ballNutHeight=10;

axisBodyDiameter = 20+(2*wallThickness);
axisBodyRadius = axisBodyDiameter/2;

axisDiameter = 13;
axisRadius = axisDiameter/2;

axisInsideWidth=11.55;
axisOutsideWidthHalf=6.55;

//axis_width=24.65;
axis_width=axisInsideWidth+(2*axisOutsideWidthHalf);

bugelWidth=30;

profileHeight=20;
slotWidth=4.5;
slotHeight=0.6;

bearingWidth=5;

screwDistance=27;

getMain();

	
module getMain() {
//	difference(){
//		axisTwo();
//		#translate([(bockLength/2)-(bugelWidth/2),-0.1,7.5])cube([bugelWidth,profileWidth/2,100]);
//	}
	halfOne();
	translate([10,0,-7.25])halfTwo();
//		axisTwo();
//		reference_grid(-20,20,-20,20,-20,20,1,1,1);
}

module halfOne(){
	difference(){
		axisTwo();
		#translate([(bockLength/2)-(bugelWidth/2),-0.1,7.5])cube([bugelWidth,profileWidth/2,100]);
	}
}
module halfTwo(){
	translate([0,profileWidth,0])rotate([0,0,180])
//	mirror([0,1,0])
	difference(){
		axisTwo();
		 halfOne();
	}
	
}

module axisTwo() {
	difference(){
	union(){
		
		difference(){
			cube([bockLength,profileWidth,axis_width]);
//			translate([-bockLength/2,-5,-5-wheelRadius])profile5_40x40(100);
			translate([0+8,profileWidth/2,-10])m5Screw(20);
			translate([bockLength-8,profileWidth/2,-10])m5Screw(20);
			
			translate([(bockLength/2)-15,0,0])hull(){
				translate([0,0,0])cube([30,profileWidth,17]);	
				translate([axisBodyRadius,profileWidth,screwDistance])rotate([90,0,0])cylinder(h=profileWidth,r=axisBodyRadius);
			}
		}
		
		difference(){
			translate([(bockLength/2)-15,0,0])bugel();
//					union(){
////						rotate([90,0,0])bearing();
//						
//					}
		}
//		translate([0,18.5,0])difference(){
//			bugel();
//			translate([25,4.1,35])union(){
//				rotate([90,0,0])bearing();
//				rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
//			}
//		}

	}
	translate([bockLength/2,profileWidth,screwDistance+15])rotate([90,0,0])m3Screw();
	translate([bockLength/2-7,profileWidth,12.5])rotate([90,0,0])m3Screw();
	translate([bockLength/2+7,profileWidth,12.5])rotate([90,0,0])m3Screw();
	}
    
    
}



module bugel() {
	difference() {
		hull(){
			translate([0,0,0])cube([bugelWidth,profileWidth,17]);	
			translate([axisBodyRadius,profileWidth,screwDistance+7])rotate([90,0,0])cylinder(h=profileWidth,r=axisBodyRadius);
		}
		translate([axisBodyRadius,profileWidth*1.5,screwDistance])rotate([90,0,0])cylinder(h=profileWidth*2,r=axisRadius);
		translate([axisBodyRadius,(profileWidth/2)+ballNutHeight/2,screwDistance])rotate([90,0,0])cylinder(h=ballNutHeight,r=ballNutRadius,$fn=6);
//		translate([axisBodyRadius,profileWidth+1,screwDistance])rotate([90,0,0])cylinder(h=2,r1=ballNutRadius+2,r2=ballNutRadius,$fn=6);
	}

}

//module axisOne() {
//		union(){
//			translate([25,axisInsideWidth+(10-axisInsideWidth/2),35])axisInsideConector();
//			difference(){
//				translate([-40,-wallThickness,profileWidth])plug20x20(50);
//				translate([-25,(profileWidth)/2,35])rotate([0,0,0])m5Hole(25);
//				translate([-25,(profileWidth)/2,35])rotate([90,0,0])m5Hole(25);
//				translate([-25,(profileWidth)/2,35])rotate([180,0,0])m5Hole(25);
//				translate([-25,(profileWidth)/2,35])rotate([270,0,0])m5Hole(25);
//				translate([-100,-clearance,(profileWidth+wallThickness)-clearance])cube([100,profileWidth+(clearance*2),profileWidth+(clearance*2)]);
//			}
//		}
//}

//module axisInsideConector() {
//	difference(){
//	   hull(){
//		   translate([-16,-11.55,-15])cube([15,axisInsideWidth,20+(wallThickness*2)]);
//		   rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisBodyRadius);
//	   }
//	   translate([0,0.01,0])rotate([90,0,0])bearing();
//		translate([0,-axisInsideWidth+bearingWidth-0.01,0])rotate([90,0,0])bearing();
//		translate([0,0,0])rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
//   }
//}
//module axisInside() {
//	difference(){
//		rotate([90,0,0])bearing();
//		translate([0,-axisInsideWidth+bearingWidth,0])rotate([90,0,0])bearing();
//		translate([0,0,0])rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
//	}
//}
//module axisOutside() {
//		rotate([90,0,0])cylinder(h=axisOutsideWidthHalf,r=axisBodyRadius);
//}

//module bearing() {
//	cylinder(h=bearingWidth,r=13.4/2);
//}


module m5Screw(h=10) {
	union() {
		cylinder(h=h,r=2.8);
		translate([0,0,h])cylinder(h=20,r=5);
	}
}

module m3Screw(h=15) {
	union() {
		translate([0,0,5])cylinder(h=h+5,r=3.6/2);
//		cylinder(h=5,r=3.6/2);
		#translate([0,0,h-0.4])cylinder(h=5.5,r=6.3/2);
		translate([0,0,-0.1])cylinder(h=5.5,r=6.9/2,$fn=6);
	}
}

module m5Hole(h=20) {
	union() {
		cylinder(h=h,r=2.8);
//		translate([0,0,h])cylinder(h=20,r=5);
	}
}

//module plug20x20(l=100) {
//	cube([l,20+(2*wallThickness),20+(2*wallThickness)]);
//   	
//}

//module profile5_20x20(l=100) {
//	difference(){
//		cube([l,profileWidth,profileWidth]);
//	}
//	
//}

//module profile5_40x40(l=100) {
//	union(){
//		profile5_20x20(l);
//		translate([0,20,0])profile5_20x20(l);
//		translate([0,20,20])profile5_20x20(l);
//		translate([0,0,20])profile5_20x20(l);
//	}
//	
//}


//reference grid

module reference_grid(minx,maxx,miny,maxy,minz,maxz,dx,dy,dz) {
  for(dxi=[minx:dx:maxx])
    for(dyi=[miny:dy:maxy])
      for(dzi=[minz:dz:maxz]) translate([dxi,dyi,dzi])
% cube(size=[dx/10,dy/10,dz/10],center=true);
}

//reference_grid(-2,2,-2,2,-2,2,1,1,1);// reference grid



