function plot= reduceresolution(blocksize1,blocksize2,blocksize3)
%This function reduces the spatial resolution of an image
%by replaing each block pixel by the average value of that block
%using the block proc function
%Function takes parameters as different blocksizes

%Read image
img=imread('face.jpg');

%Create function to run on image
func=@(block_struct) mean2(block_struct.data) * ones(size(block_struct.data)) ;

% Distinct block processing with different block sizes for image 
img2=blockproc(img,[blocksize1 blocksize1],func);
img3=blockproc(img,[blocksize2 blocksize2],func);
img4=blockproc(img,[blocksize3 blocksize3],func);

img2=uint8(img2);
img3=uint8(img3);
img4=uint8(img4);

subplot(2,2,1),imshow(img);
title('1: Original image');
subplot(2,2,2),imshow(img2);
title('2: Reduced resolution');
subplot(2,2,3),imshow(img3);
title('3: Reduced resolution');
subplot(2,2,4),imshow(img4);
title('4: Reduced resolution');