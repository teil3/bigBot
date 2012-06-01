thickness=3;
nema17Width=42.30;
nema17ScrewWidth = nema17Width-11;

width=8.5;
length=nema17Width;

bladeThickness=2;

union(){
	difference(){
		cube([width, length, thickness]);
		translate([width/2,5.5,0])cylinder(h=10,r=4/2,$fn=12);
		translate([width/2,nema17ScrewWidth+5.5,0])cylinder(h=10,r=4/2,$fn=12);
	}
	translate([0,(length-bladeThickness)/2,0])cube([width-2, bladeThickness, 10]);
	
}