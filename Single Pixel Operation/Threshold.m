function re_img = Threshold(img,T,min,max)
  s = size(img);
  re_img = zeros(s(1),s(2),"uint8");
  if nargin == 0
    error "You must provide image and threshold";
  endif
  if nargin == 1
    error "You must provide threshold";
  endif
  if nargin < 3
    min = 0;
  endif
  if nargin < 4
    max = 255;
  endif
  for i = 1:s(1)
    for j = 1:s(2)
      if( img(i,j) < T )
        re_img(i,j) = min;
      else
        re_img(i,j) = max;
      endif
    endfor
  endfor
endfunction