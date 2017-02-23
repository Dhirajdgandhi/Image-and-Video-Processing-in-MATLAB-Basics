function plot= intensitylevels()
%This function gives outputs on different intensity levels for an image
% Multiplication simply gives the intensity level image

% Read image and get Dimensions of image
img=uint8(imread('face.jpg'));
[row,col]=size(img);

subplot(2,4,1),imshow(img);
title('8bits');
subplot(2,4,2),imshow(img*1);
title('7bits');

subplot(2,4,3),imshow(img*2);
title('6bits');
subplot(2,4,4),imshow(img*3);
title('5bits');

subplot(2,4,5),imshow(img*4);
title('4bits');
subplot(2,4,6),imshow(img*5);
title('3bits');

subplot(2,4,7),imshow(img*6);
title('2bits');
subplot(2,4,8),imshow(img*7);
title('1bit');