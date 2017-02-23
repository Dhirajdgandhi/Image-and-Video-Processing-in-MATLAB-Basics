function plot= threshold()
% This function finds threshold and then applies the
% threshold to get a new image

% Read image and get Dimensions of image
img=rgb2gray(imread('moon.jpeg'));
[row,col]=size(img)

% Mean intensity value of image
avg=cast(mean2(img),'uint8')

% Output image initialized with all 0'z
img2=zeros(row,col);

% Thresholding each pixel value
for c = 1:row
    for d = 1:col
        if img(c,d) > avg
            img2(c,d)=1;
        end
    end
end

% Display images
subplot(2,2,1),imshow(img);
title('Subplot 1: Original image');
subplot(2,2,2),imshow(img2);
title('Subplot 2: Threshold image');