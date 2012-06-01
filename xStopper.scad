thickness=3;
//nema17Width=42.30;
//nema17ScrewWidth = nema17Width-11;

holderWidth=13;
holderLength=16;
//length=nema17Width;

bladeThickness=2;

union(){
	difference(){
		cube([holderLength, holderWidth, thickness]);
		translate([10,6,0])cylinder(h=10,r=5.8/2,$fn=12);
//		translate([width/2,nema17ScrewWidth+5.5,0])cylinder(h=10,r=4/2,$fn=12);
	}
	//translate([0,(length-bladeThickness)/2,0])
	cube([bladeThickness, holderWidth,  10]);
	#translate([-8,0,0])cube([8, bladeThickness,  10]);
	
}