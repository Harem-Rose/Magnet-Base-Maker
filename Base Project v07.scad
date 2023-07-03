//Version History
//v01 - Manual
//v02 - Initial SCAD version
//v03 - Increased magnet stud limit to 500. Puts studs in a circle automatically
//v04 - Automatically increase the thickness if magnets are larger than the base defaults
//v05 - Added possibility for Cubic in addition to Cylinder magnets
//v06 - Added ability to create square and hex bases
//    - Added in Glue Slots into magnet studs
//v07 - Added ability to include slots for "multibasing" on top. 



//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Basic User Variables
//All measurement based variables are in mm
//Once you have modified the parameters as you desire, press F6 on your keyboard

//Style of Base Edge: "Inverted","Traditional","Straight"
BaseStyle = "Inverted";
//Shape of Base: "Circle", "Square", or "Hex"
BaseShape = "Circle";
//Desired Length of Base. For ovals make this the largest number
BaseLength = 25;
//Desired Width of Base. For ovals make this the smallest number
BaseWidth = 25;


//How far from the center should the studs be? Enter a number from 0-100. Values that are too small will result in magnet hole collisions.
MagnetEdgeDistancePercent=80; 
//Style of Magnet. "Cubic" or "Cylinder"
MagnetStyle = "Cylinder";
//Height of Magnet
MagnetHeight = 2;
//Width of Magnet
MagnetWidth = 3; 
//Length of Magnet - Only for Cubic
MagnetLength = 0; 
//How many studs do you want
MagnetStuds = 1; 
//How wide should the glue slot be in the Magnet Stud
SlotWidth = .5;

//Add Cross Braces between magnet studs. 0 for No, 1 for Yes
//Set to 1 to include bracing along Y axis
IncludeYBracing = 0; //Suggested only for MagnetStud values of 2 or higher
//Set to 1 to include bracing along X axis
IncludeXBracing = 0; //Suggested only for MagnetStud values of 4 or higher



//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Variables for multibasing
//Set to 1 if you want to make a multibase
MakeMultiBase = 0; 
//How far from the center should the multibase holes be? Enter a number from 0-100. Values that are too small will result in multibase hole collisions.
MultiBaseDistancePercent = 100; 
//Width of Multibase
MultiBaseWidth = 22;
//Depth of Multibase
MultiBaseDepth = 4;
//Number of Multibases (in circle)
MultiBaseCount = 0; 
//Set to 1 if you want an additional spot in the middle of the main base. This will be in addition to the bases from above variable
MultiBaseAddCenter = 1; 
//Variables for Magnets in multibase

//Width of Multibase's Magnet
MultiBaseMagnetWidth = 3;
//Depth of Mutlibase's Magnet
MultiBaseMagnetDepth = 1;

MultiBaseCrescent = 360; //The arc to put the bases in. The first slot is not added. 2 bases at 180 degrees will put the bases at 0 and 90. 360 will get you 0 and 180. The + 0 is to prevent the option from appearing in the side panel.
MultiBaseRotate = 0; //Use to rotate where the bases are located. Can prevent main base's magnets and mini base magnets from being too close.


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Variables for Center Dimple
MagnetMarkerAdd = 0; //Set to 1 if you want
MagnetMarkerType = "Dimple"; //"Dimple" for a dot, or "Through" to go all the way through the base. Through is best used to help align multibasing.
MagnetMarkerWidth = 0.3;



//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Advanced User Variables

//Number of poly edges around outside of base.
CircleEdgeFaces = BaseShape == "Square" ? 4 : (BaseShape == "Hex" ? 6 : 300); 

//How many MM thick for the upper flat portion of the outer edge. Total Height of base is the combination of this and the next variable
BaseFlatHeight = 1; //Thickness of the flat portion
//How many MM thick for the tapered portion of the outer edge. Total Height of base is the combination of this and the previous variable
BaseTaperHeight = 3; //Thickness of the tapered bottom portion

//Additional Depth to Magnet Hole. For Resin Shrinkage
MagnetExtraSinkDepth = 0.1; //Extra depth for resin shrinkage
//Additional Wdith to Magnet Hole. For Resin Shrinkage
MagnetExtraWidth = 0.2; //Extra space around magnet for resin shrinkage
//How wide the bottom lip around the magnet should be
MagnetStudBotExtra = 1; //How wide the bottom lip around the magnet should be
//How wide the stud's contact point with the base should be
MagnetStudTopExtra = 3; //How wide the stud's contact point with the base should be



//How wide the base's bottom edge should be
BottomLipThickness = 1;

//How wide the bracing's bottom edge should be (The Side towards the table)
BracingThinWidth = 1; //How thick should the bottom of the braces be (The side towards the table)
//How wide the top of the bracing should be (The side towards the base/model)
BracingWideWidth = 3; //How thick should the top of the braces be (The side towards the base/model)

//Set to 1 to have Y Axis Bracing go from edge to edge instead of from stud to stud
YBracingToEdge = 1; //0 for default brace behavior. 1 If you would like the Y brace to go all the way to the edge instead of to the stud
//Set to 1 to have X Axis Bracing go from edge to edge instead of from stud to stud
XBracingToEdge = 1; //0 for default brace behavior. 1 If you would like the X brace to go all the way to the edge instead of to the stud


HollowThicknessUserVar = 1.25; //How thin will the base be after hollowing it out. If using MultiBasing, Base may be thicker than desired to allow space

//Minimum thickness above magnet slots. Base thickness will increase if MagnetHeight+MagnetExtraSinkDepth+MinimumSpaceAboveMagnet is greater than BaseFlatHeight+BaseTaperHeight
MinimumSpaceAboveMagnet = 0.5; //Minimum thickness above magnet slots

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Advanced MultiBase Variables
MultiBaseExtraWidth = 0.5+0;
MultiBaseExtraDepth = 0.15+0;
MultiBaseMagnetWidthExtra = 0.2+0;
MultiBaseMagnetDepthExtra = 0.1+0;
MultiBaseCircleEdgeFaces = 300+0;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Please do not change any variables below this point as it may result in undesired behavior












//Please do not change any variables below this point as it may result in undesired behavior
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//AutoVariables
//Do not change these values
TaperSize = 1.5+0;

LengthDiameter = BaseShape == "Square" ? ((BaseStyle == "Traditional" ? (BaseLength - (TaperSize*2)) : BaseLength)*sqrt(2)) : (BaseStyle == "Traditional" ? (BaseLength - (TaperSize*2)) : BaseLength); // Square
WidthDiameter = BaseShape == "Square" ? ((BaseStyle == "Traditional" ? (BaseWidth - (TaperSize*2)) : BaseWidth)*sqrt(2)) : (BaseStyle == "Traditional" ? (BaseWidth - (TaperSize*2)) : BaseWidth); // Square

OvalXScale = WidthDiameter/LengthDiameter;


//Variable names are based on base's intended real-world alignment. Top = Towards model/base. Bot = Towards Table/Ground




OuterDiameterTop = LengthDiameter; //The Taper will be the same size as the disk of the base
OuterDiameterBotDiff = BaseStyle == "Traditional" ? (-TaperSize) : (BaseStyle == "Inverted" ? (TaperSize) : 0); //This is how much smaller the bottom of the taper is than the top of the taper
OuterDiameterBot = OuterDiameterTop - (OuterDiameterBotDiff * 2); //This is how much smaller the bottom of the taper is than the top of the taper on the outside
InnerDiameterBot = OuterDiameterBot - (BottomLipThickness   * 2); //This is how much smaller the bottom of the taper is than the top of the taper on the Inside
InnerDiameterTop = InnerDiameterBot - 3; //This is how much smaller the top of the taper is than the bottom of the taper on the inside

HollowThickness = (MakeMultiBase == 1) ? (MinimumSpaceAboveMagnet + MultiBaseDepth + MultiBaseExtraDepth + MultiBaseMagnetDepth + MultiBaseMagnetDepthExtra): HollowThicknessUserVar;

MagnetStudBotWidth = MagnetWidth + MagnetStudBotExtra + MagnetExtraWidth; //Overall Size of the bottom (Table)  of the Magnet Stud
MagnetStudTopWidth = MagnetWidth + MagnetStudTopExtra + MagnetExtraWidth; //Overall Size of the bottom (Figure) of the Magnet Stud

MagnetStudsMax = MagnetStuds >= 500 ? 500 : MagnetStuds; //Defunct, but baked in code.

MagnetEdgeDistancePercentValidate = MagnetEdgeDistancePercent >= 100 ? 100 : MagnetEdgeDistancePercent; //Limit the max stud distance from center to 100% of radius
MagnetEdgeDistancePercentCalc = MagnetEdgeDistancePercentValidate/100; //Convert EdgeDistance to actual percentage value

MagnetStudYOffset = (((OuterDiameterTop-OuterDiameterBotDiff)/2)-(MagnetStudTopWidth/2)) * MagnetEdgeDistancePercentCalc; //Auto variable for Y stud distance to edge
MagnetStudXOffset = ((OuterDiameterTop/2*OvalXScale - MagnetStudTopWidth/2)-OuterDiameterBotDiff/2) * MagnetEdgeDistancePercentCalc; //Auto Variable for X stud distance to edge

BracingYCutoff = MagnetStudYOffset-(MagnetWidth/2) - MagnetExtraWidth/2; //Termination point for Y braces ending at stud
BracingXCutoff = MagnetStudXOffset-(MagnetWidth/2) - MagnetExtraWidth/2; //Termination point for X Braces ending at stud

BracingYLength = YBracingToEdge >= 1 ? (InnerDiameterBot/2) : BracingYCutoff ; //Termination point for Y braces ending at tapered edge
BracingXLength = XBracingToEdge >= 1 ? ((InnerDiameterBot*OvalXScale)/2) : BracingXCutoff ; //Termination point for X Braces ending at tapered edge

CircleEdgeFacesHidden = 0 + 40;//Hoa many edge faces should be on the outside of the magnet studs, and the inside of the hollow taper
CircleEdgeFacesMagHole = 0 + 60;//How many edge faces should the magnet holes have. Too few may cause fitment issues.

//For oval bases, have 3 studs be in-line
InLine3rdStud = ((MagnetStudsMax == 3 && LengthDiameter != WidthDiameter) || (MagnetStudsMax % 2 != 0 && MagnetStudsMax != 3)) ? "Yes" : "No";
SubtractStud = InLine3rdStud == "Yes" ? 1 : 0;

MagnetTotalHeight = MagnetHeight + MagnetExtraSinkDepth + MinimumSpaceAboveMagnet;

BaseTotalHeight = BaseFlatHeight + BaseTaperHeight;

MultiBaseTotalHeight = MakeMultiBase == 1 ? (MultiBaseDepth + MultiBaseExtraDepth) + (MultiBaseMagnetDepth + MultiBaseMagnetDepthExtra) : 0;
echo("MagnetTotalHeight",MagnetTotalHeight);
echo("MultiBaseTotalHeight",MultiBaseTotalHeight);
echo("BaseTotalHeight",BaseTotalHeight);
echo("MagnetTotalHeight+MultiBaseTotalHeight",MagnetTotalHeight+MultiBaseTotalHeight);
echo("NewBaseHeight",AdjustedBaseFlatHeight+BaseTaperHeight);

//AdjustedBaseFlatHeight = (MagnetTotalHeight >= BaseTotalHeight) ? MagnetTotalHeight - BaseTaperHeight : BaseFlatHeight ;
//AdjustedBaseFlatHeight = ((MagnetTotalHeight + (MakeMultiBase == 1 ? (MultiBaseDepth + MultiBaseExtraDepth + MultiBaseMagnetDepth + MultiBaseMagnet) : 0)) >= BaseTotalHeight) ? ((MakeMultiBase == 1 ? 2 : 0) + MagnetTotalHeight) - BaseTaperHeight : BaseFlatHeight ;

AdjustedBaseFlatHeight = ((MagnetTotalHeight + MultiBaseTotalHeight) >= BaseTotalHeight) ? MultiBaseTotalHeight + MagnetTotalHeight - BaseTaperHeight : BaseFlatHeight ;



//MultiBase
MultiBaseYOffset = (((OuterDiameterTop-OuterDiameterBotDiff)/2)-((MultiBaseWidth+MultiBaseExtraWidth)/2)) * (MultiBaseDistancePercent/100); //Auto variable for Y stud distance to edge
MultiBaseXOffset = ((OuterDiameterTop/2*OvalXScale - (MultiBaseWidth+MultiBaseExtraWidth)/2)-OuterDiameterBotDiff/2) * (MultiBaseDistancePercent/100); //Auto Variable for X stud distance to edge




//Bracing Points
    CubeYPoints = [
      [-(BracingWideWidth/2),  0,  0 ],  //0
      [ (BracingWideWidth/2),  0,  0 ],  //1
      [ (BracingWideWidth/2),  BracingYLength,  0 ],  //2
      [-(BracingWideWidth/2),  BracingYLength,  0 ],  //3
      [-(BracingThinWidth/2),  0,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //4
      [ (BracingThinWidth/2),  0,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //5
      [ (BracingThinWidth/2),  BracingYLength,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //6
      [-(BracingThinWidth/2),  BracingYLength,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ]]; //7
      
    CubeXPoints = [
      [-(BracingWideWidth/2),  0,  0 ],  //0
      [ (BracingWideWidth/2),  0,  0 ],  //1
      [ (BracingWideWidth/2),  BracingXLength,  0 ],  //2
      [-(BracingWideWidth/2),  BracingXLength,  0 ],  //3
      [-(BracingThinWidth/2),  0,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //4
      [ (BracingThinWidth/2),  0,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //5
      [ (BracingThinWidth/2),  BracingXLength,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ],  //6
      [-(BracingThinWidth/2),  BracingXLength,  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness) ]]; //7      

//SquareStuds
    CubeStudPoints = [
      [-((MagnetWidth + MagnetStudTopExtra)/2),  -((MagnetLength + MagnetStudTopExtra)/2),  0 ],  //0
      [ ((MagnetWidth + MagnetStudTopExtra)/2),  -((MagnetLength + MagnetStudTopExtra)/2),  0 ],  //1
      [ ((MagnetWidth + MagnetStudTopExtra)/2),  ((MagnetLength + MagnetStudTopExtra)/2),  0 ],  //2
      [-((MagnetWidth + MagnetStudTopExtra)/2),  ((MagnetLength + MagnetStudTopExtra)/2),  0 ],  //3
      [-((MagnetWidth + MagnetStudBotExtra)/2),  -((MagnetLength + MagnetStudBotExtra)/2),  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness)],  //4
      [ ((MagnetWidth + MagnetStudBotExtra)/2),  -((MagnetLength + MagnetStudBotExtra)/2),  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness)],  //5
      [ ((MagnetWidth + MagnetStudBotExtra)/2),  ((MagnetLength + MagnetStudBotExtra)/2),  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness)],  //6
      [-((MagnetWidth + MagnetStudBotExtra)/2),  ((MagnetLength + MagnetStudBotExtra)/2),  (AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness)]]; //7
      
    CubeHolePoints = [
      [-(MagnetWidth/2)+MagnetExtraWidth,  -(MagnetLength/2)+MagnetExtraWidth,  0 ],  //0
      [ (MagnetWidth/2)+MagnetExtraWidth,  -(MagnetLength/2)+MagnetExtraWidth,  0 ],  //1
      [ (MagnetWidth/2)+MagnetExtraWidth,   (MagnetLength/2)+MagnetExtraWidth,  0 ],  //2
      [-(MagnetWidth/2)+MagnetExtraWidth,   (MagnetLength/2)+MagnetExtraWidth,  0 ],  //3
      [-(MagnetWidth/2)+MagnetExtraWidth,  -(MagnetLength/2)+MagnetExtraWidth,  AdjustedBaseFlatHeight + BaseTaperHeight + 5],  //4
      [ (MagnetWidth/2)+MagnetExtraWidth,  -(MagnetLength/2)+MagnetExtraWidth,  AdjustedBaseFlatHeight + BaseTaperHeight + 5],  //5
      [ (MagnetWidth/2)+MagnetExtraWidth,   (MagnetLength/2)+MagnetExtraWidth,  AdjustedBaseFlatHeight + BaseTaperHeight + 5],  //6
      [-(MagnetWidth/2)+MagnetExtraWidth,   (MagnetLength/2)+MagnetExtraWidth,  AdjustedBaseFlatHeight + BaseTaperHeight + 5]]; //7

  CubeFaces = [
      [0+0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left  




//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Modules

module PegStud () //Module for the studs, without holes
    {
    if (MagnetStyle == "Cylinder")
        {
        cylinder (h=(AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness), d1=MagnetStudTopWidth, d2 = MagnetStudBotWidth, $fn=CircleEdgeFacesHidden);
        };
    if (MagnetStyle == "Cubic")
        {
        polyhedron (CubeStudPoints, CubeFaces);
        };
    }
module PegHole () //Module for the holes. Separated from PegStud to allow these to be cut out last
    {
    if (MagnetStyle == "Cylinder")
        {
        translate([0,0,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)]) cylinder (h=MagnetHeight + 3, d=MagnetWidth+MagnetExtraWidth, $fn=CircleEdgeFacesMagHole);
        rotate([0,0,45])translate([-MagnetStudTopWidth/2,-SlotWidth/2,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)])cube([MagnetStudTopWidth,SlotWidth,BaseFlatHeight+BaseTaperHeight+2]);  
        rotate([0,0,45])translate([-SlotWidth/2,-MagnetStudTopWidth/2,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)])cube([SlotWidth,MagnetStudTopWidth,BaseFlatHeight+BaseTaperHeight+2]);   
        };
    if (MagnetStyle == "Cubic")
        {
        translate([0,0,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)])polyhedron (CubeHolePoints, CubeFaces);
        rotate([0,0,45])translate([-MagnetStudTopWidth,-SlotWidth/2,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)])cube([MagnetStudTopWidth*2,SlotWidth,BaseFlatHeight+BaseTaperHeight]);  
        rotate([0,0,45])translate([-SlotWidth/2,-MagnetStudTopWidth,-(MagnetExtraSinkDepth)+(BaseTaperHeight-MagnetHeight)])cube([SlotWidth,MagnetStudTopWidth*2,BaseFlatHeight+BaseTaperHeight]);   
        };
    }
module MultiBaseHole ()
    {
    rotate([0,180,0]) translate ([0,0,-(MultiBaseDepth+MultiBaseExtraDepth)]) cylinder (h=50, d=(MultiBaseWidth+MultiBaseExtraWidth), $fn = MultiBaseCircleEdgeFaces);
    rotate([0,180,0]) translate ([0,0,-(MultiBaseDepth+MultiBaseExtraDepth+MultiBaseMagnetDepth+MultiBaseMagnetDepthExtra)]) 
        cylinder (h=40, d=(MultiBaseMagnetWidth+MultiBaseMagnetWidthExtra), $fn = MultiBaseCircleEdgeFaces);
    }
module MagnetStudMarker()
    {
    if(MagnetMarkerType == "Dimple" ) {sphere (r=MagnetMarkerWidth, $fn = 10);}
    if(MagnetMarkerType == "Through") translate ([0,0,-50])cylinder (r=MagnetMarkerWidth, $fn = 10, h = 100);
    }
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Code


rotate([0,180,90])
//Remove MagnetHoles
difference()
    {
    //Add MagnetStuds and Cross Bracing
    union()
        {
        //Carve Out Underside
        difference()
            {
            //Combine FlatTop and TaperedBottom
            hull()
                {
                //FlatTop
                translate([0,0,0])scale([OvalXScale,1,1]) cylinder(h=AdjustedBaseFlatHeight, d=LengthDiameter, $fn=CircleEdgeFaces);
                //TaperedBottom
                translate([0,0,(AdjustedBaseFlatHeight)])difference()
                    {
                    scale([OvalXScale,1,1]) cylinder(h=BaseTaperHeight, d1=OuterDiameterTop, d2=OuterDiameterBot, $fn=CircleEdgeFaces);
                    };
                };
            //Underside Carveout
            hull()
                {
                translate([0,0,AdjustedBaseFlatHeight + BaseTaperHeight]) rotate([0,180,0])scale([OvalXScale,1,1]) cylinder(h=(AdjustedBaseFlatHeight + BaseTaperHeight - HollowThickness), d2=InnerDiameterTop, d1=InnerDiameterBot, $fn=CircleEdgeFacesHidden);
                translate([0,0,AdjustedBaseFlatHeight + BaseTaperHeight]) scale([OvalXScale,1,1]) cylinder(h=3, d=InnerDiameterBot, $fn=CircleEdgeFaces);
                }
            };
        //Code for MagnetStuds
        if (InLine3rdStud == "Yes") {translate([0,0,(HollowThickness)])PegStud();}; //Center Stud if number of studs is odd
        for (i = [0:(MagnetStudsMax - SubtractStud )]) 
            {

            translate([sin(360*i/(MagnetStuds - SubtractStud))*MagnetStudXOffset, (cos(360*i/(MagnetStuds - SubtractStud))*MagnetStudYOffset), (HollowThickness) ])
            rotate([0,0,-360*i/(MagnetStudsMax - SubtractStud)])
            PegStud();
            }

        //Code for CrossBracing
        //Y Bracing
       if (IncludeYBracing == 1)
            {       
            translate([0,0,HollowThickness])polyhedron( CubeYPoints, CubeFaces );
            rotate(180,0,0)translate([0,0,HollowThickness])polyhedron( CubeYPoints, CubeFaces );
            }
        //X Bracing
        if (IncludeXBracing == 1)
            {        
            rotate(90,0,0)translate([0,0,HollowThickness])scale([1,1,1])polyhedron( CubeXPoints, CubeFaces );
            rotate(270,0,0)translate([0,0,HollowThickness])scale([1,1,1])polyhedron( CubeXPoints, CubeFaces );
            }
        };
    //Code for MagnetHoles
    if (InLine3rdStud == "Yes") {translate([0,0,AdjustedBaseFlatHeight])PegHole();}; //Center Stud if number of studs is odd
    for (i = [0:(MagnetStudsMax - SubtractStud )]) 
        {
        translate([sin(360*i/(MagnetStudsMax - SubtractStud))*MagnetStudXOffset, (cos(360*i/(MagnetStudsMax - SubtractStud))*MagnetStudYOffset), (AdjustedBaseFlatHeight) ])
        rotate([0,0,360*i/(MagnetStudsMax - SubtractStud)])
        PegHole();
    if (MagnetMarkerAdd == 1)
            {
            translate([sin(360*i/(MagnetStudsMax - SubtractStud))*MagnetStudXOffset, (cos(360*i/(MagnetStudsMax - SubtractStud))*MagnetStudYOffset), (0) ])
        rotate([0,0,360*i/(MagnetStudsMax - SubtractStud)])
            MagnetStudMarker();
            };
        }
    if (MakeMultiBase == 1)
        {
        for (i = [1:(MultiBaseCount)])
            {
                rotate([0,0,MultiBaseRotate])
                translate([sin((MultiBaseCrescent)*i/(MultiBaseCount))*MultiBaseXOffset, (cos((MultiBaseCrescent)*i/(MultiBaseCount))*MultiBaseYOffset), 0])
                rotate([0,0,-(MultiBaseCrescent)*i/(MultiBaseCount)])
                MultiBaseHole();
            }
         if (MultiBaseAddCenter == 1)
            {
            MultiBaseHole();
            }
        }
    if (MagnetMarkerAdd == 1)
        {
        MagnetStudMarker();
        }
    };  
    
