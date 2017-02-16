A = imread("ab-small.pgm");
r = rows(A);
c = columns(A);

B = ones(r*2,c*2);
for i = 1:2:r*2
  for j = 1:2:c*2
    B(i,j) = A( uint8(i/2) , uint8(j/2) );
  endfor
endfor

imshow(B)