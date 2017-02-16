clear;
A = imread("bb-small" , "ppm" );
zoom = input ("How many times whould you like to zoom this picture : ");
S = size(A);
#Don't make B unsigned 8 bit yet, otherwise divisions become weird
B = zeros(S(1)*zoom, S(2)*zoom , S(3));

i = ( ( (1:S(1)) - 1 )*zoom) + 1;
j = ( ( (1:S(2)) - 1 )*zoom) + 1;
B(i,j,:) = A(1:S(1) , 1:S(2) , :);    #Initial Values

k = setdiff(1:( size(B)(2) - 1),j);    #Horizontal
B(i,k,:) = ( B(i,k-1,:) + B(i,k+1,:) ) / 2;

l = setdiff(1:( size(B)(1) - 1),i);    #Vertical
B(l,j,:) = ( B(l-1,j,:) + B(l+1,j,:) ) / 2;

#Diagonal
B(l,k,:) = ( B(l-1,k-1,:) + B(l+1,k-1,:) + B(l-1,k+1,:) + B(l+1,k+1,:) ) / 4;

#imshow only accepts 8 bit unsigned integers
B = uint8(B);
imshow(B);
imwrite(B,"bb-zoom-interpolation.ppm","ppm");
