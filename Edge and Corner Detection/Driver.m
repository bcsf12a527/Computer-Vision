%img = [30 20 10 90; 80 70 10 50; 80 70 10 90; 20 50 80 90]
A = imread('psycho_triangle.jpg');
A = rgb2gray(A);
B = CanyEdgeDetector(A,150,50);
imwrite(B,'Corner.jpg');