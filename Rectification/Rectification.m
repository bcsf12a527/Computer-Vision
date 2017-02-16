clear;
A = imread("image.jpg" , "jpg");
#points = [3096 744; 2900 681; 2848 2436; 2908 2485; 3726 1130; 3650 1378; 2293 765; 2277 980]
imshow(A);
[x y] = ginput(8)
#x(1,:) = points(:,1);
#y(1,:)= points(:,2);

%2 pairs of parallel lines from 8 points
lines = zeros(4,3);
j = 1;
for i = 1:2:8
  lines(j,:) = cross( [x(i) y(i) 1] , [x(i+1) y(i+1) 1] );
  j++;
endfor

%2 ideal points from 2 pairs of parallel lines
idealpoints = zeros(2,3);
j = 1;
for i = 1:2:4
  idealpoints(j,:) = cross( [lines(i,1) lines(i,2) lines(i,3)] , [lines(i+1,1) lines(i+1,2) lines(i+1,3)] );
  j++;
endfor

%Line At Infinity in image from two ideal points in image
LineAtInfinity = cross( [idealpoints(1,1) idealpoints(1,2) idealpoints(1,3)] , [idealpoints(2,1) idealpoints(2,2) idealpoints(2,3)] );

T = [1 0 0; 0 1 0; LineAtInfinity(1)/LineAtInfinity(3) LineAtInfinity(2)/LineAtInfinity(3) 1];

B = projective2d(A,T);
imwrite(B , "00 plane projection transformed.jpg" , "jpg");