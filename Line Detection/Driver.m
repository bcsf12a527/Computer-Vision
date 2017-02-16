img = imread('line.jpg');
Hough_Matrix = Hough_Transformation(img);
imshow(uint8(Hough_Matrix) , []);

%Thresholding
#Hough_Matrix(Hough_Matrix < 20) = 0;