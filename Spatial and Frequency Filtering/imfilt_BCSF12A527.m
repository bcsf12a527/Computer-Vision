function B = imfilt(F,A)
  sizeF = size(F);
  cpoint = [round( sizeF(1)/2 ) round( sizeF(2)/2 )];
  sizeA = size(A);
  B = zeros(sizeA(1),sizeA(2));
  for i = 0:sizeA(1) - sizeF(1)
    for j = 0:sizeA(2) - sizeF(2)
      for k = 1:sizeF(1)
        for l = 1:sizeF(2)
          B(i+cpoint(1),j+cpoint(2)) = B(i+cpoint(1),j+cpoint(2))+( A(i+k,j+l)*F(k,l) );
        endfor
      endfor
    endfor
  endfor
  B = uint8(B);
endfunction