A = imread("ab-small.pgm", "pgm");
figure(1);
imshow(A);
F = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
F = [1 0 -1; 1 0 -1; 1 0 -1];
B = imfilt(F,A);
figure(2);
imshow(B);