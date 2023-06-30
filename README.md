# Magnet-Base-Maker

Usage Instructions for the OpenSCAD Base Builder program

Preparation:
	If you have not done so already, download and install OpenSCAD.
	It is an Open Source Free software.
	It is available at: HTTPS://OpenSCAD.org

Purpose:
	The .SCAD file is has been written to allow for the creation of custom sized bases with magnet slots.

Key Features:

	1. Circular or Oval bases can be made
	2. Any size can be made
	3. Magnet studs can be added for cylinder or square bases.
	4. Any number of magnet slots/studs can be added
	5. Bases have an option for 3 edge styles. Please see "EdgeStyles.txt"

Usage Instructions: 

	You must open the .scad file in OpenSCAD
	There are two ways to make changes to the base file generator
		1. Modify the Editor Directly in the left pane
		2. Modify the variables in the parameters in the right pane
	There are comments (Identified as any text after dual slashes "//") that inform on what each variable does.
	The comments preceede the line/variable that they describe
	Once you have made the necessary changes, you can press F5 to preview your changes
	If you are satisfied with the changes you have made, press F6 to render it into a usable model
	The render process may take a while. While it's working, the preview window will be empty.
	Once the model re-appears in the preview window, you should be able to export it. To do so:
		1. Click File
		2. Click Export
		3. Save the file

	
There are 3 options for the style of base edge: Inverted, Traditional, Straight

	1. Inverted
		A. Bases are the specified sizes at the top of the base, nearest the model. Base Tapers inwards as the taper goes down towards the bottom/table
		B. Bases are easier to pick up off of a flat surface, especially when magnetized
	2. Traditional
		A. Bases are the specified sizes at the bottom of the base, nearest the table. Base tapers inwards as the taper goes up towards the top/model
		B. Bases more closely match traditional gaming bases like those from Games Workshop
	3. Straight
		A. Bases are the specified sizes from top to bottom along. There is no taper
		B. Bases would resemble a cutout from material such as MDF or Acrylic


Warning:
The program will let you add any number of magnets which may result in undesireable behavior
If magnet studs are clipping into each other, either increase the distance to the edge. (MagnetEdgeDistancePercent) or reduce the number/size of magnets to a reasonable amount
