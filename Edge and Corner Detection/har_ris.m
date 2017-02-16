pkg load image;

img = imread('psycho_triangle.jpg');
img = rgb2gray(img);
%figure, imshow(img);

dx = [-1 0 1; -1 0 1; -1 0 1];
dy = dx';

Ix = conv2(img, dx, 'same');
Iy = conv2(img, dy, 'same');    

sigma = 0.5;
g = fspecial('gaussian',max(1,fix(6*sigma)), sigma);
g

Ix2 = conv2(Ix.^2, g, 'same');
Iy2 = conv2(Iy.^2, g, 'same');
Ixy = conv2(Ix.*Iy, g, 'same');

% Harris corner measure
%hcm = (Ix2.*Iy2 - Ixy.^2)./(Ix2 + Iy2 + eps);
k = 0.04;
hcm = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;

threshold = 70000000;
hcm = (hcm>threshold);
[r, c] = find(hcm);

figure, imagesc(img), axis image, colormap(gray), hold on
plot(c, r, 'g*'), title('corners detected');