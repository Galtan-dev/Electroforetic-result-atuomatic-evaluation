// To make this script run in Fiji, please activate 
// the clij and clij2 update sites in your Fiji 
// installation. Read more: https://clij.github.io

// Generator version: 2.5.1.6

// Init GPU
run("CLIJ2 Macro Extensions", "cl_device=");

// Load image from disc 
open("C:/DATA/VSCHT-main/Magistr/2. semestr/BioImAnalysis/Projekt/CLIJx_Img_test1.tif");
image_1 = getTitle();
Ext.CLIJ2_pushCurrentZStack(image_1);
// The following auto-generated workflow is made for processing a 2D or 3D dataset.
// For processing multiple channels or time points, you need to program a for-loop.
// You can learn how to do this online: https://www.youtube.com/watch?v=ulSq-x5_in4

// Copy
Ext.CLIJ2_copy(image_1, image_2);
Ext.CLIJ2_release(image_1);

Ext.CLIJ2_pull(image_2);


// Gaussian Blur 
sigma_x = 2.0;
sigma_y = 2.0;
sigma_z = 2.0;
Ext.CLIJx_imageJ2GaussianBlur(image_2, image_3, sigma_x, sigma_y, sigma_z);
Ext.CLIJ2_release(image_2);

Ext.CLIJ2_pull(image_3);

// Local Threshold Mean
radius = 50.0;
c_value = 6.0;
Ext.CLIJx_localThresholdMean(image_3, image_4, radius, c_value);
Ext.CLIJ2_release(image_3);

Ext.CLIJ2_pull(image_4);

// Erode Box
Ext.CLIJ2_erodeBox(image_4, image_5);
Ext.CLIJ2_release(image_4);

Ext.CLIJ2_pull(image_5);
Ext.CLIJ2_release(image_5);
