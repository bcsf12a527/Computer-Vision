clear;
A = imread("bb.ppm" , "ppm" );
zoom = input ("How many times whould you like to zoom this picture : ");
S = size(A) ;
B = uint8(zeros(S(1)*zoom, S(2)*zoom , S(3)));

i = ( ( (1:S(1)) - 1 )*zoom) + 1;
j = ( ( (1:S(2)) - 1 )*zoom) + 1;
B(i,j,:) = A(1:S(1) , 1:S(2) , :);

B(i+1,j,:) = B(i,j,:);
B(i+1,j+1,:) = B(i,j,:);
B(i,j+1,:) = B(i,j,:);

imshow(B);
imwrite(B,"bb-zoom-nearest.ppm","ppm");
