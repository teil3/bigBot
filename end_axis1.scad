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


axisBodyDiameter = 20+(2*wallThickness);
axisBodyRadius = axisBodyDiameter/2;

axisDiameter = 10;
axisRadius = axisDiameter/2;

axisInsideWidth=11.55;
axisOutsideWidthHalf=6.55;

//axis_width=24.65;
axis_width=axisInsideWidth+(2*axisOutsideWidthHalf);


profileHeight=20;
slotWidth=4.5;
slotHeight=0.6;

bearingWidth=5;

production=true;

getMain();

	
module getMain() {
	if(production){
		translate([30,60,0])rotate([90,0,0])
		axisOne();
		translate([0,0,-2.5])rotate([90,0,0])
		axisTwo();
	} else {
		axisOne();
		axisTwo();
	}
}

module axisTwo() {
	union(){
		
		difference(){
			translate([-5,-2.5,-5])cube([bockLength,axis_width+0.5,axis_width]);
			translate([-bockLength/2,-5,-5-wheelRadius])profile5_40x40(100);
			#translate([3,10,-10])m5Screw(20);
			#translate([47,10,-10])m5Screw(20);
		}
		
		difference(){
			bugel();
					translate([25,-2.52,35])mirror([0,1,0])union(){
						rotate([90,0,0])bearing();
						rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
					}
		}
		translate([0,18.5,0])difference(){
			bugel();
			translate([25,4.1,35])union(){
				rotate([90,0,0])bearing();
				rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
			}
		}

	}
    
    
}



module bugel() {
			hull(){
				translate([10,-2.5,18])cube([30,axisOutsideWidthHalf,17]);	
				translate([25,-2.5,35])mirror([0,1,0])rotate([90,0,0])cylinder(h=axisOutsideWidthHalf,r=axisBodyRadius);
			}

}

module axisOne() {
		union(){
			translate([25,axisInsideWidth+(10-axisInsideWidth/2),35])axisInsideConector();
			difference(){
				translate([-40,-wallThickness,profileWidth])plug20x20(50);
				#translate([-25,(profileWidth)/2,35])rotate([0,0,0])m5Hole(25);
				translate([-25,(profileWidth)/2,35])rotate([90,0,0])m5Hole(25);
				#translate([-25,(profileWidth)/2,35])rotate([180,0,0])m5Hole(25);
				translate([-25,(profileWidth)/2,35])rotate([270,0,0])m5Hole(25);
				translate([-100,-clearance,(profileWidth+wallThickness)-clearance])cube([100,profileWidth+(clearance*2),profileWidth+(clearance*2)]);
			}
		}
}

module axisInsideConector() {
	difference(){
	   hull(){
		   translate([-16,-11.55,-15])cube([15,axisInsideWidth,20+(wallThickness*2)]);
		   rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisBodyRadius);
	   }
	   translate([0,0.01,0])rotate([90,0,0])bearing();
		translate([0,-axisInsideWidth+bearingWidth-0.01,0])rotate([90,0,0])bearing();
		translate([0,0,0])rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
   }
}
module axisInside() {
	difference(){
		rotate([90,0,0])bearing();
		translate([0,-axisInsideWidth+bearingWidth,0])rotate([90,0,0])bearing();
		translate([0,0,0])rotate([90,0,0])cylinder(h=axisInsideWidth,r=axisRadius);
	}
}
//module axisOutside() {
//		rotate([90,0,0])cylinder(h=axisOutsideWidthHalf,r=axisBodyRadius);
//}

module bearing() {
	cylinder(h=bearingWidth,r=13.4/2);
}


module m5Screw(h=10) {
	union() {
		cylinder(h=h,r=2.8);
		translate([0,0,h])cylinder(h=20,r=5);
	}
}

module m5Hole(h=20) {
	union() {
		cylinder(h=h,r=2.8);
//		translate([0,0,h])cylinder(h=20,r=5);
	}
}

module plug20x20(l=100) {
	cube([l,20+(2*wallThickness),20+(2*wallThickness)]);
   	
}

module profile5_20x20(l=100) {
	difference(){
		cube([l,profileWidth,profileWidth]);
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



