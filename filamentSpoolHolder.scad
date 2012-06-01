profil_width=20.2;
wallThickness=3;

spoolAxisDiameter=8.8;
spoolAxisRadius=spoolAxisDiameter/2;

profilCap();

module profilCap(){
	union(){
		difference(){
			
			translate([-wallThickness,0,0])cube([profil_width+(wallThickness*2),profil_width,profil_width+wallThickness]);
			cube([profil_width,profil_width,profil_width]);
			#translate([-profil_width/2,profil_width/2,profil_width/2])rotate([0,90,0])cylinder(h=profil_width*2,r=5.6/2);
		}
		#translate([-3,0,profil_width+wallThickness])axisHolder();
		#translate([8.4,0,profil_width+wallThickness])axisHolder();
	}
}

module axisHolder(){
	difference(){
		#cube([spoolAxisDiameter+(wallThickness*2),profil_width,spoolAxisDiameter]);
		hull(){
			#translate([(spoolAxisDiameter+(wallThickness*2))/2,profil_width,(spoolAxisDiameter+wallThickness)/2])rotate([90,0,0])cylinder(h=profil_width+0.1,r=spoolAxisRadius);
			#translate([(spoolAxisDiameter+(wallThickness*2))/2,profil_width+0.1,(spoolAxisDiameter+wallThickness)])rotate([90,0,0])cylinder(h=profil_width+0.1,r=spoolAxisRadius);
		}
	}
}

