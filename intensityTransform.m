function plot= intensityTransform()
%This function is to transform the intensity of an image.

% Read image and take it on gray scale. 
I=rgb2gray(imread('liftingbody.jpg'));

% Dimensions of image
[row,col]=size(I);

% Get the complement(negative) of the image
trans1 = imcomplement(I);

subplot(3,2,1),imshow(I);
title('Subplot 1: Original image');
subplot(3,2,3),subimage(trans1);
title('Subplot 2: Complement image');

% By Contrast strecting 
I2=im2double(I);
contrastImg=1./(1+(0.6./(I2+eps)).^10);
subplot(3,2,4),subimage(contrastImg);
title('Subplot 2: Contrast stretched image');

% By Gamma correction with low gamma value to get a bright image.
trans3=imadjust(I, [], [], 0.35);
subplot(3,2,5),subimage(trans3);
title('Subplot 2: Gamma image');

% By Gamma correction with high gamma value to get a dark image.
trans4=imadjust(I, [], [], 3.5);
subplot(3,2,6),subimage(trans4);
title('Subplot 2: Gamma image');