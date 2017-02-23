function plot= noise()
% This function adds random noise to an image.
% It adds the noisy images N times.
% Observation : Addition of noisy images N times,gives a image where details are lost.
% As N increases, the image details are gradually LOST.
% Addition results in pixels values get closer to 255 and thus whiten the
% image.

%Read the image
img=imread('face.jpg');

%Get the dimensions of image
[row,col]=size(img)

%Add noise to image 
J = imnoise(img,'gaussian'); %Gaussian noise
%OR J = imnoise(img,'salt & pepper'); % Salt and pepper noise

%ouput image with same dimensions as input initialized with all ones
img2=ones(row,col);

% Adding noise N times
N=3;
for i=1:N
    J = imnoise(J,'gaussian');
    img2=uint8(img2)+uint8(J); 
    subplot(2,5,i),imshow(J); %Plot each image
end

%Resulting image after adding all noisy images.
subplot(2,5,8),imshow(img2);
title('Subplot 2: Adding all');
