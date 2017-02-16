function Hough_Matrix = Hough_Transformation(img)
  pkg load image;
  %img = rgb2gray(img);
  edges = edge(img,'Canny');

  %Quantization
  s = size(edges);
  max_p = round( sqrt( s(1)^2 + s(2)^2 ) );

  %Quantized Matix for VOTING
  Hough_Matrix = zeros(2*max_p,360);

  [x y] = find(edges == 1);

  %VOTING
  for theta = 1:360
  for i = 1:size(x,1)
    p = round( x(i)*cosd(theta-1) + y(i)*sind(theta-1) );
    Hough_Matrix(p+max_p,theta) = Hough_Matrix(p+max_p,theta) + 1;
  endfor
  endfor

  figure
  imshow(uint8(Hough_Matrix) , []);

  %Thresholding
  %Hough_Matrix(Hough_Matrix < 20) = 0;
endfunction