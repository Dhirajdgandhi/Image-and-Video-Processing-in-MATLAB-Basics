function plot= twocats()
%This function uses sobel filter to find horizontal and vertical edges
% It does in both frequency domain as well in spatial domain.
% It converts freq domain output to spatial via inverse FFT.

% Read image and take it on gray scal
I=imread('two_cats.jpg');

% Dimensions of image
[row,col]=size(I);

subplot(2,2,1),imshow(I)
title('1:Original Image');

% Generate horizontal edge using sobel filter
h = fspecial('sobel');
% Apply filter to get horizontal edges
Jh = imfilter(I,h);
subplot(2,2,2),imshow(Jh)
title('1:Horizontal');

% Invert kernel to detect vertical edges
v = h';
% Apply filter to get vertical edges
Jv = imfilter(I,v);
subplot(2,2,3),imshow(Jv)
title('1:Vertical');

% Get both the edges by adding the results
J=Jv+Jh;
subplot(2,2,4),imshow(J)
title('1:Add');

% Padding 
PQ=2*size(I)

% Fast fourier transform to get filters and image in freq domain
fv=fft2(v,PQ(1),PQ(2));
fh=fft2(h,PQ(1),PQ(2));
fI=fft2(I,PQ(1),PQ(2));

% Multiplication operation in freq domain to get filtered images
Jfh=fI .* fh;
Jfv=fI .* fv;
%figure,imshow(Jfh);
%figure,imshow(Jfv);

% Apply inverse fourier transform to get filtered images in spatial domain 
Jh=ifft2(Jfh);
Jv=ifft2(Jfv);
figure,imshow(Jh);
figure,imshow(Jv);

% Add both results to get result in spatial domain
J=Jh+Jv;
% Convert matrix to grayscale image
J=mat2gray(J);
figure,imshow(J);

