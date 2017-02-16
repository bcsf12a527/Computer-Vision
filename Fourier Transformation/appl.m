close all
clear all
clc

ap = imread('apple1.bmp');

%Fourier Transform Image 2D
f = fft2(ap);
%Map origin to middle because all transformations on frequencies start from middle
fsh = fftshift(f);

figure, imshow(ap);
figure, imshow(f);
figure, imshow(fsh);
figure, imshow(fsh, []);
figure, imshow(log(fsh));
