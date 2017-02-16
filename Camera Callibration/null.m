function null_space = null (matrix)
  [u s v] = svd(matrix);
  
  min = s(1,1);
  col_no = 1;
  
  for i = 1:size(s)(1)
    if( min > s(i,i) )
      min = s(i,i);
      col_no = i;
    endif
  endfor
  
  null_space = v(:,col_no);
endfunction