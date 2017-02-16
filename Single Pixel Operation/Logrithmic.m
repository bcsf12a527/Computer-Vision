function re_img = Logrithmic(img,base,constant)
  s = size(img);
  re_img = zeros(s(1),s(2), "uint8");
  if nargin == 0
    error "You must provide image";
  endif
  if nargin < 2
    base = 10;
  endif
  if nargin < 3
    constant = 1;
  endif
  re_img = constant.*( log10(1+img)/log10(base) );
endfunction