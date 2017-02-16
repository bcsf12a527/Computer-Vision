close all;
clear all;
clc;

pkg load image;

a = imread('q1a.jpg');
b = imread('q1b.jpg');

[rows cols clrs] = size(a);
b = imresize(b, [rows, cols]);

a = double(a);
b = double(b);

subplot(231);
imshow(uint8(a), []);
subplot(234);
imshow(uint8(b), []);

h1 = zeros(rows, cols, 'double');
h2 = zeros(rows, cols, 'double');

rc = floor(rows/2);
cc = floor(cols/2);

dnot = 25;
dnot2 = 6;

for r=1:rows
    for c=1:cols
        h1(r,c) = exp(-((rc-r)^2 + (cc-c)^2) / (2*dnot^2));
        h2(r,c) = 1 - h1(r,c) + 0.1 ;
        if h2(r,c) > 1
            h2(r,c) = 1 ;
        end
        h12(r,c) = exp(-((rc-r)^2 + (cc-c)^2) / (2*dnot2^2));
        h22(r,c) = 1 - h12(r,c) + 0.1 ;
        if h22(r,c) > 1
            h22(r,c) = 1 ;
        end
    end
end

subplot(232);
imshow(h1);
subplot(235);
imshow(h2);

for clr=1:3
    af(:,:,clr) = fftshift(fft2(a(:,:,clr)));
    bf(:,:,clr) = fftshift(fft2(b(:,:,clr)));

    ar(:,:,clr) = af(:,:,clr).*h1;
    br(:,:,clr) = bf(:,:,clr).*h2;

    ao(:,:,clr) = ifft2(ifftshift(ar(:,:,clr)));
    bo(:,:,clr) = ifft2(ifftshift(br(:,:,clr)));

    ar2(:,:,clr) = af(:,:,clr).*h22;
    br2(:,:,clr) = bf(:,:,clr).*h12;

    ao2(:,:,clr) = ifft2(ifftshift(ar2(:,:,clr)));
    bo2(:,:,clr) = ifft2(ifftshift(br2(:,:,clr)));

end

mix = uint8(abs((ao+bo)/2));
mix2 = uint8(abs((ao2+bo2)/2));

subplot(233);
imshow(mix);
subplot(236);
imshow(mix2);
