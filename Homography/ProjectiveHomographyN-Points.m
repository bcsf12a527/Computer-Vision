n = input("Enter the number of corresponding points you want to use for homography");

img1 = imread ('ab-small-left.pgm');
figure(1);
imshow(img1);
[ApointsX ApointsY] = ginput(n)

img2 = imread ('ab-small-right.pgm');
figure(2);
imshow(img2);
[BpointsX BpointsY] = ginput(n)

A = zeros(2*n,8);
B = zeros(2*n,1);

j = 1;
for i = 1:2:2*n
  A(i,1) = ApointsX(j);
  A(i,2) = ApointsY(j);
  A(i,3) = 1;
  A(i,7) = BpointsX(j)*ApointsX(j);
  A(i,8) = BpointsX(j)*ApointsY(j);
  
  A(i+1,4) = ApointsX(j);
  A(i+1,5) = ApointsY(j);
  A(i+1,6) = 1;
  A(i+1,7) = BpointsY(j)*ApointsX(j);
  A(i+1,8) = BpointsY(j)*ApointsY(j);
  
  B(i) = BpointsX(j);
  B(i+1) = BpointsY(j);
  
  j++;
endfor

At = transpose(A);
AtA = At*A;
AtB = At*B;

X = ( inv(AtA) )*(AtB);

T = [X(1) X(2) X(3); X(4) X(5) X(6); X(7) X(8) 1]

img1Transformed = projective2d(img1,T);
imshow(img1Transformed);