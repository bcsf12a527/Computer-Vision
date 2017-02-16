function result = cross (p1,p2)
  result = [0 -p1(3) p1(2); p1(3) 0 -p1(1); -p1(2) p1(1) 0] * transpose(p2);
  result = transpose(result);
endfunction