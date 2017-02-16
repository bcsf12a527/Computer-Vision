clear;
clc;
x = [-180:180];
y = sind(x);
im1 = repmat(y, 361,1);
figure;
colormap gray;
imagesc(im1, []);




im2 = fft2(im1);
figure;
colormap gray;
imagesc(abs(im2), []);

im3 = fftshift(im2);
figure;
colormap gray;
imagesc(abs(im3), []);

im4 = im1';
im5 = fftshift(fft2(im4));
figure;
colormap gray;
imagesc(abs(im5), []);

