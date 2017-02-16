clear all;
clc;
pkg load image;

a = imread('q1a.pgm');
b = imread('q1b.pgm');

[rows cols] = size(a);
b = imresize(b, [rows, cols]);

a = double(a);
b = double(b);

h1 = zeros(rows, cols, 'double');
h2 = zeros(rows, cols, 'double');

rc = floor(rows/2);
cc = floor(cols/2);

dnot = 50; %--------------------------- CHANGE THE VALUE TO MAKE DIFFERENCES

for r=1:rows
    for c=1:cols
        h1(r,c) = exp(-((rc-r)^2 + (cc-c)^2) / (2*dnot^2));
        h2(r,c) = 1 - h1(r,c) + 0.1 ;
        if h2(r,c) > 1
            h2(r,c) = 1 ;
        end
    end
end

subplot(231);
imshow(a, []);
subplot(234);
imshow(b, []);

subplot(232);
imshow(h1, []);
subplot(235);
imshow(h2, []);

af = fftshift(fft2(a));
bf = fftshift(fft2(b));

ar = af.*h1;
br = bf.*h2;

ao = ifft2(ifftshift(ar));
bo = ifft2(ifftshift(br));

mix = uint8(real((ao+bo)/2));

subplot(233);
imshow(mix, []);

%---- extra work

af = fftshift(fft2(b));
bf = fftshift(fft2(a));

ar = af.*h1;
br = bf.*h2;

ao = ifft2(fftshift(ar));
bo = ifft2(fftshift(br));

mix = uint8(abs((ao+bo)/2));

subplot(236);
imshow(mix, []);

