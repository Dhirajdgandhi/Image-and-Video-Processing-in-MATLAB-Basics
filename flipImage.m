function plot = flipImage(img,direction)
% This function rotates the image either vertically or horizontally
% depending on the input parameters
% img - Image and direction is 1 - horizontal ; 2 - vertical

% Flip Image 
flippedimg = flipdim(img,direction);

subplot(2,2,1),imshow(img)
title('Subplot 1: Original image');
subplot(2,2,2),imshow(flippedimg)
title('Subplot 2: Flipped image');
