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
	5. Bases have an inverted taper. This helps in the following ways
		A. Bases are easier to pick up off of a flat table, especially when magnetized
		B. The widest portion of the base is towards the model which allows just a little more foot space

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

	For GW taper:
		1. Go to line 101 and put a - sign in front of the 1.5 but after the = sign
		2. when adjusting the length and width diameter, subtract 3 from your desired size (22 for 25mm, 37 for 40mm)
		That gives you the GW taper: https://i.imgur.com/LfStFfZ.png



Warning:
The program will let you add any number of magnets which may result in undesireable behavior
If magnet studs are clipping into each other, either increase the distance to the edge. (MagnetEdgeDistancePercent) or reduce the number/size of magnets to a reasonable amount
