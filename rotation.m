function plot= rotation(angle1,angle2)
% This function rotates an image by angle degrees in counter clockwise
% direction. Give parameters 45,90 for better understanding. 

% Read image and get Dimensions of image
img=imread('parrot.jpg');
[row,col]=size(img);

% Rotate images 
img2=imrotate(img,angle1);
img3=imrotate(img,angle2);

% Display images 
subplot(2,3,1),imshow(img);
title('1: Original image');
subplot(2,3,2),imshow(img2);
title('2: Rotated image');
subplot(2,3,3),imshow(img3);
title('3: Rotated image');

% Rotate images by using different interpolation methods specified
img2=imrotate(img,angle1,'bilinear','crop');
img3=imrotate(img,angle1,'bicubic');

% Display images 
subplot(2,3,4),imshow(img);
title('1:Nearest');
subplot(2,3,5),imshow(img2);
title('2:Bilinear and crop');
subplot(2,3,6),imshow(img3);
title('2:Bicubic');
