function plot= generatehistogram()
% This function generates a histogram of image.

% Read image and take it on gray scale. 
% try with 'seed1.img' ,'seed2.img' and 'seed3.img'.
I=rgb2gray(imread('seed1.jpg'));

% Dimensions of image
[row,col]=size(I);

%Plot the original image 
subplot(2,1,1),imshow(I)
title('1: Image');

%Generate histogram of image and plot it
subplot(2,1,2),imhist(I)
title('1: Histogram');
