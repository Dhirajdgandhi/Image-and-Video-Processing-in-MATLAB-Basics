function plot=myhistogramEQ()
% This function implements the histogram equalisation technique to enhance
% an image.

% Read image and take it on gray scale. 
% try with 'seed1.img' ,'seed2.img' and 'seed3.img'.
I=rgb2gray(imread('seed3.jpg'));

numofpixels=size(I,1)*size(I,2);

subplot(2,2,1),imshow(I) %Can also use : figure,imshow(I);
title('Original Image');
subplot(2,2,3),imhist(I)
title('1: Histogram of original image');

% Initialize output image with all zeros. same dimensions as input image.
HIm=uint8(zeros(size(I,1),size(I,2)));

% Initialize matrices
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);


%freq counts the occurrence of each pixel value.
%The probability of each occurrence is calculated by probf.
for i=1:size(I,1)
    for j=1:size(I,2)
        value=I(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end

sum=0;
% The range of values we are using (here 0-255)
no_bins=255;


%The cumulative distribution probability is calculated. 
for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*no_bins);
end

for i=1:size(I,1)
    for j=1:size(I,2)
            HIm(i,j)=output(I(i,j)+1);
    end
end

subplot(2,2,2),imshow(HIm)
title('Histogram equalised image');
subplot(2,2,4),imhist(HIm)
title('2: Histogram of enahnced image');
