xCarHoleX=26.75;
xCarHoleY=33.20;
xCarHoleZ=2.9;



hotendRadius=8.3;
hotendHeight=17;

tubeEndHeight=13;
tubeEndRadius=5.4;
tubeRadius=2.9;

topX=40;
topY=30;
topZ=tubeEndHeight+5;

filamentRadius=3/2;

no_of_nuts = 2;		// number of captive nuts required, standard = 1
nut_angle = 180;		// angle between nuts, standard = 90
nut_shaft_distance = 2.5;

nut_elevation=10;
m3_dia = 3.2;		// 3mm hole diameter
m3_nut_hex = 1;		// 1 for hex, 0 for square nut
m3_nut_flats = 5.9;	// normal M3 hex nut exact width = 5.5
m3_nut_depth = 2.9;	// normal M3 hex nut exact depth = 2.4, nyloc = 4	
m3_nut_points = 2*((m3_nut_flats/2)/cos(30));

motor_shaft=15;
pulley_b_ht = 15;		// pulley base height, standard = 8. Set to same as idler_ht if you want an idler but no pulley.
pulley_b_dia=40;

difference(){
	union(){
		translate([0,0,xCarHoleZ])top();
//		bottom();
	}
	translate([3.5,-6,-17])m3Screw(40);
	translate([3.5,6,-17])m3Screw(40);
	
}

module top(){
	difference(){
		translate([-topX/2+4,-topY/2,0])cube([topX,topY,topZ]);
		translate([-8,0,-hotendHeight-2])twHotend();
	}
}

module bottom(){
	difference(){
		union(){
			xCarHole();
			translate([-8,0,-hotendHeight])twoHotendHolder();
		}
		translate([-8,0,-hotendHeight-2])twHotend();
	}
}

module xCarHole(){
	hull(){
		cylinder(h=xCarHoleZ, r=xCarHoleX/2);
		translate([xCarHoleY-xCarHoleX,0,0])cylinder(h=xCarHoleZ, r=xCarHoleX/2);
	}
}

module twHotend(){
	hotend();
	translate([22.5,0,0])hotend();
}

module hotend(){
	union(){
		cylinder(h=hotendHeight, r=hotendRadius);
		translate([0,0,-100])cylinder(h=200, r=filamentRadius);
		//tubeend
		translate([0,0,19])cylinder(h=tubeEndHeight,r=tubeEndRadius);
//		#translate([0,0,30])cylinder(h=tubeEndHeight,r=tubeRadius);
	}
	
}
module hotendHolder(){
	difference(){
		cylinder(h=hotendHeight, r=hotendRadius+7);
		translate([0,0,-5])rotate([0,0,0])nuts();		
	}
//	translate([23,0,0])cylinder(h=hotendHeight, r=hotendRadius+10);
	
}
module twoHotendHolder(){
	hotendHolder();
	translate([22.5,0,0])mirror([1,0,0])hotendHolder();
	
}

module nuts(){
	for(j=[1:no_of_nuts]) rotate([0,0,j*nut_angle])
	translate([0,0,nut_elevation])rotate([90,0,0])
	
	union()
	{
		//entrance
		#translate([0,m3_nut_depth/2,motor_shaft/2+m3_nut_depth/2+nut_shaft_distance]) cube([m3_nut_flats,pulley_b_ht,m3_nut_depth],center=true);
		//nut
		if ( m3_nut_hex > 0 )
		{
			// hex nut
			#translate([0,0.25,motor_shaft/2+m3_nut_depth/2+nut_shaft_distance]) rotate([0,0,30]) cylinder(r=m3_nut_points/2,h=m3_nut_depth,center=true,$fn=6);
		} else {
			// square nut
			translate([0,0.25,motor_shaft/2+m3_nut_depth/2+nut_shaft_distance]) cube([m3_nut_flats,m3_nut_flats,m3_nut_depth],center=true);
		}
		
		//grub screw hole
		#rotate([0,0,22.5])cylinder(r=m3_dia/2,h=pulley_b_dia/2+1,$fn=8);
		rotate([0,0,22.5])#translate([0,0,15])cylinder(r=3,h=3,$fn=12);
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