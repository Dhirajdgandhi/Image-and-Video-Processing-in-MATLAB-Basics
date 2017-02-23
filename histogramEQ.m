function plot= histogramEQ()
% This function uses the in-built histogram-equalisation function.

% Read image and take it on gray scale. 
% try with 'seed1.img' ,'seed2.img' and 'seed3.img'.
I=rgb2gray(imread('seed3.jpg'));

% Dimensions of image
[row,col]=size(I);

% Built-in method of image equalisation
J=histeq(I);

subplot(2,2,1),imshow(I)
title('1: Original Image');

subplot(2,2,2),imhist(I)
title('1: Histogram of original image');

subplot(2,2,3),imshow(J)
title('1: Enhanced Image');

%Generate histogram of equalised image and plot it
subplot(2,2,4),imhist(J)
title('1: Histogram of original image');