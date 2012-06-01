bearingOuterDiameter=13;
bearingHeight=5;
bearingInnerDiamter=4;

cableThickness=1.8;

holderLength=20;
//holderBaseWidth=20;
holderCornerRadius=5;
holderAxisDistance=15;

spaceBteHolderAWhel=0.5;

wallThickness=2;

totalThickness=bearingHeight+(wallThickness*2)+(2*spaceBteHolderAWhel);

$fn = 120;

cableGroove();
translate([0,0,-(totalThickness-bearingHeight)/2])pulleyHolder();
echo(totalThickness);

module cableGroove(){
	difference(){
		cylinder(h=bearingHeight,r=(bearingOuterDiameter+3)/2);
		cylinder(h=bearingHeight,r=bearingOuterDiameter/2);
		translate([0,0,bearingHeight/2])rotate_extrude(convexity = 10)
		translate([(bearingOuterDiameter+4)/2, 0, 0])
		circle(r = cableThickness/2);		
	}
}
module pulleyHolder(){
	difference(){
		translate([0,0,totalThickness/2])
		hull(){
			translate([-holderAxisDistance,0,0])cube([1,holderLength,totalThickness], center=true);
			cylinder(h=totalThickness,r=holderCornerRadius,center=true);
		}
		#translate([-holderAxisDistance+5,-holderLength/2,(totalThickness-(bearingHeight+(2*spaceBteHolderAWhel)))/2])cube([holderAxisDistance+(holderCornerRadius*2),holderLength,bearingHeight+(2*spaceBteHolderAWhel)]);
	}
}