%Load Image Package
pkg load image

%Read 2 Images
I1 = imread('IMG_20160621_013200.jpg');
I2 = imread('IMG_20160621_013147.jpg');
%Show 2 Images
subplot(1,2,1);
imshow(I1);
subplot(1,2,2);
imshow(I2);

%Load Camera Parameters
load cameraParams.mat
%Undistorte Images
I1 = undistortimage(I1,FocalLength, );
I2 = undistortimage(I2,FocalLength, );

