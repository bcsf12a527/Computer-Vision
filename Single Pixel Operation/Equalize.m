function re_img = Equalize(img, k)
  s = size(img);
  re_img = zeros(s(1),s(2),"uint8");
  
  if nargin == 1
    k=8;
  endif
  L = 2^k;
  
  his = zeros(1,L, "double");
  norm_his = zeros(1,L, "double");

  #Histogram for image
  for i = 1:s(1)
    for j = 1:s(2)
      his( 1+img(i,j) ) = his( 1+img(i,j) ) + ( 1/( s(1)*s(2) ) );
    endfor
  endfor

  #Normalized Histogram / Commulative frequency
  for i = 1:L
    norm_his(i) = sum( his(1:i) );
  endfor
  
  #Reconstruct Image
  for i = 1:s(1)
    for j = 1:s(2)
      re_img(i,j) = round( norm_his( 1+img(i,j) ) * (L-1) ) ;
    endfor
  endfor

endfunction