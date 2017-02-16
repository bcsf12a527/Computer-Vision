function re_img = Power(img,power,constant)
  s = size(img);
  re_img = zeros(s(1),s(2), "uint8");
  if nargin == 0
    error "You must provide image and power";
  endif
  if nargin == 1
    error "You must provide power";
  endif
  if nargin < 3
    constant = 1;
  endif
  
  re_img = constant.*( img.^power );
endfunction