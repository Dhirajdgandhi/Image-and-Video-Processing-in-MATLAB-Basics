function plot= templatematch()
%This function matches a small template image to a bigger image.

% Read image and take it on gray scale. 
% Try with the 3 templates : 'template1.jpg','template2.jpg','template3.jpg'
board=rgb2gray(imread('board.jpg'));
template=rgb2gray(imread('template1.jpg'));

% Dimensions of image
[row,col]=size(board)
[row,col]=size(template)

% Plot the images
subplot(2,2,1),imshow(board);
title('1:Original Image');
subplot(2,2,2),imshow(template);
title('1:Original Image');

% Normalized 2-D cross-correlation to brighten the part of image which
% matches the template
C = normxcorr2(template, board);
figure; imshow(C);

% Finds the co-ordinates where the intensity is maximum
[ypeak, xpeak] = find(C==max(C(:)))
% Find the plot of intensity values on a surface
figure, surf(C), shading flat;