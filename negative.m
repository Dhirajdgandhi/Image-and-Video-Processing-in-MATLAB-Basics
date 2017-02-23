function plot= negative()
%This function gives the negative of an image

% Read image and get Dimensions of image
img=imread('face.jpg');
[row,col]=size(img)

% Output image
img2=zeros(row,col);
% Get complement of image
img2 = 255 - img;

% Display images
subplot(2,2,1),imshow(img);
title('Subplot 1: Original image');
subplot(2,2,2),imshow(img2);
title('Subplot 2: Negative image');