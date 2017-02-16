function B = projective2d(A,T)
  SA = size(A);

  %Using endpoints of orignal image calculate endpoints of transformed image
  EndPointsOrignal = [0 0 SA(1) SA(1); 0 SA(2) 0 SA(2); 1 1 1 1];
  EndPointsTransformed = T*EndPointsOrignal;

  %Unhomogenise
  EndPointsTransformed(:,1) = EndPointsTransformed(:,1) / EndPointsTransformed(3,1);
  EndPointsTransformed(:,2) = EndPointsTransformed(:,2) / EndPointsTransformed(3,2);
  EndPointsTransformed(:,3) = EndPointsTransformed(:,3) / EndPointsTransformed(3,3);
  EndPointsTransformed(:,4) = EndPointsTransformed(:,4) / EndPointsTransformed(3,4);

  %Transformed Co-ordinates
  Ymin = min(EndPointsTransformed(2,:));
  Ymax = max(EndPointsTransformed(2,:));
  Xmin = min(EndPointsTransformed(1,:));
  Xmax = max(EndPointsTransformed(1,:));

  B = zeros(Xmax - Xmin , Ymax - Ymin , SA(3) , "uint8");
  T = inv(T);

  for i = 1:size(B)(1)
    for j = 1:size(B)(2)
      
      %Inverse transformation of Transformed image co-ordinates to get actual image co-ordinates
      point = T*[i+Xmin;j+Ymin;1];
      
      %If transformed co-ordinates doesn't correspond to any point in orignal image
      point(1) = point(1) / point(3);
      point(2) = point(2) / point(3);
      
      %Seperate integer and decimal part(for weighted average or interpolation)
      fP1 = floor(point(1));
      cP1 = ceil(point(1));
      fracP1 = point(1) - fP1;
      
      fP2 = floor(point(2));
      cP2 = ceil(point(2));
      fracP2 = point(2) - fP2;
      
      %Problem still occurs if transformed indexes become zero after floor function
      if(fP1 == 0)
        fP1 = 1;
      endif
      if(fP2 == 0)
        fP2 = 1;
      endif
      if(cP1 > SA(1))
        cP1 = SA(1);
      endif
      if(cP2 > SA(2))
        cP2 = SA(2);
      endif
      
      %If transformed coordinate doesn't correspond to any coordinate in actual image
      if( point(1) > 0 && point(2) > 0 && fP1 <= SA(1) && fP2 < SA(2) )
        %weighted average of nearest pixels
        B(i,j,:) = A(fP1,fP2,:).*((1-fracP1)*(1-fracP2)) + A(cP1,fP2,:).*((1-fracP1)*fracP2 ) + A(fP1,cP2,:).*(fracP1*(1-fracP2)) + A(cP1,cP2,:).*(fracP1*fracP2) ;
      endif
    endfor
  endfor
endfunction