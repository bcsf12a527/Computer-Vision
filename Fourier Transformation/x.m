close all
clear all
clc

im = imread('hor_stripes.jpg');

f2 = fft2(im);
figure
imshow(f2);

f3=fftshift(f2);
figure
imshow(f3);