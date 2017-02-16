function re_img = Negate(img)
  s = size(img);
  re_img = zeros(s(1),s(2),"uint8");
  if nargin == 0
    error "You must provide image";
  endif
  
  re_img = 255- img;
endfunction