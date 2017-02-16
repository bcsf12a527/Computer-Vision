function re_img = CanyEdgeDetector(img, Th, Tl)
  pkg load image
  filterX = [-1 1]';
  filterY = [-1 1];

  #Derivative of image w.r.t x
  dx = imfilter(img,filterX);
  #Derivative of image w.r.t y
  dy = imfilter(img,filterY);

  #Gradient magnitude = √dx^2+dy^2
  magnitude = sqrt(dx.^2 + dy.^2);
  magnitude = uint8( magnitude );
  #Gradient angle = tan inverse(dy/dx), we don't need 360 rather 180 degrees
  gradient = abs(atan2d(dy,dx));
  gradient = floor( gradient / 45 );

  #Non maxima suppression
  for i = 2:size(img,1)-1
    for j = 2:size(img,2)-1
      if(gradient(i,j) == 0)
        if(magnitude(i-1,j) > magnitude(i,j) || magnitude(i+1,j) > magnitude(i,j))
          magnitude(i,j) = 0;
        endif
      endif
      if(gradient(i,j) == 1)
        if(magnitude(i-1,j-1) > magnitude(i,j) || magnitude(i+1,j+1) > magnitude(i,j))
          magnitude(i,j) = 0;
        endif
      endif
      if(gradient(i,j) == 2)
        if(magnitude(i,j-1) > magnitude(i,j) || magnitude(i,j+1) > magnitude(i,j))
          magnitude(i,j) = 0;
        endif
      endif
      if(gradient(i,j) == 3)
        if(magnitude(i+1,j-1) > magnitude(i,j) || magnitude(i-1,j+1) > magnitude(i,j))
          magnitude(i,j) = 0;
        endif
      endif
    endfor
  endfor
  
  #Hysteresis Thresholding
  re_img = Hysteresis(magnitude,Th,Tl);
  
endfunction