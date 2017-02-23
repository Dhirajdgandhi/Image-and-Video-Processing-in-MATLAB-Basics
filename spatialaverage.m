function plot= spatialaverage(neighbour)
%This function shows spatial averaging of an image to reduce the resolution
%of the image i.e cause blurring

% Read image
img=imread('face.jpg');
% Resize image
img=imresize(img,[100 100]);
% Get dimensions of image
[row,col]=size(img)

%----------------------Method 1-----------------------%
% Direct implementation of convolution operation to do the spatial
% filtering
img3=conv2(double(img), double(ones(3)/(3*3)), 'valid');
img3=uint8(img3);
%----------------------Method 2-----------------------%
% Number of cells in each direction 
cells=cast(neighbour/2,'uint8')-1

% Output image
img2=(zeros(row,col));

% for neighbourhood of 3 :- block=[-1,0,1]
block=[-cells:cells];
if(mod(neighbour,2)==0) %even
    block=[-cells+1:cells];
end

% For every cell Spatial filtering is done
for a = 1:row
    for b = 1:col
        sum=0;
        count=0;
        for c = block
            for d = block
                if(a+c>0 && b+d>0 && a+c<=row && b+d<=col)
                    sum = sum + double(img(a+c,b+d));
                    count=count+1;
                end
            end
        end
        img2(a,b)=sum/count;
    end
end

img2=uint8(img2);

subplot(2,2,1),imshow(img);
title('1: Original image');
subplot(2,2,3),imshow(img3);
title('2: Method 1 output');
subplot(2,2,4),imshow(img2);
title('2: Method 2 output');
