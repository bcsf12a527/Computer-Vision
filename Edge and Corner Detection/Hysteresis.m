function bw = Hysteresis(im, Th, Tl)

    if Th < Tl    % Th and Tl reversed - swap values 
      tmp = Th;
      Th = Tl; 
      Tl = tmp;
    endif
    
    aboveTl = im > Tl;                     % Edge points above lower threshold. 
    [aboveThr, aboveThc] = find(im > Th);  % Row and colum coords of points above upper threshold.

    % Obtain all connected regions in aboveTl that include a point that has a value above Th 
    bw = bwselect(aboveTl, aboveThc, aboveThr, 8);
endfunction