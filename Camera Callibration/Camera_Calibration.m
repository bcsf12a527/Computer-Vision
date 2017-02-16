clear;

PointsReal = [16.4 33	29.7; 18.4 33	29.7; 33 15.8	24.5; 34.9 15.8	24.5; 47 26 36.9; 57.6 14.6	4.7; 30	8.3	72.1; 31.4 8.3 72.1; 80.3	5.6	23.5; 91.3 7.2 29.5; 98	9	11.4];
PointsRealX = PointsReal(:,1)
PointsRealY = PointsReal(:,2)
PointsRealZ = PointsReal(:,3)

%Orignally X was taken along horizontally
PointsImage = [3473	221; 3403	220; 2856	884; 2792	882; 2363	418; 2026	1068; 1506 1050; 1463 1053; 1238 1246; 891	1080; 422	1335];
PointsImageX = PointsImage(:,2)
PointsImageY = PointsImage(:,1)

C = zeros(12,12);
j = 1;
for i = 1:2:12
  %Fill first row
  C(i,1) = -PointsRealX(j);
  C(i,2) = -PointsRealY(j);
  C(i,3) = -PointsRealZ(j);
  C(i,4) = -1;
  C(i,9) = PointsImageX(j)*PointsRealX(j);
  C(i,10) = PointsImageX(j)*PointsRealY(j);
  C(i,11) = PointsImageX(j)*PointsRealZ(j);
  C(i,12) = PointsImageX(j);
  
  %Fill second row
  C(i+1,5) = -PointsRealX(j);
  C(i+1,6) = -PointsRealY(j);
  C(i+1,7) = -PointsRealZ(j);
  C(i+1,8) = -1;
  C(i+1,9) = PointsImageY(j)*PointsRealX(j);
  C(i+1,10) = PointsImageY(j)*PointsRealY(j);
  C(i+1,11) = PointsImageY(j)*PointsRealZ(j);
  C(i+1,12) = PointsImageY(j);
  j++;
endfor
C
X = null(C)
C*X

TransformationMatrix = [X(1) X(2) X(3) X(4); X(5) X(6) X(7) X(8); X(9) X(10) X(11) X(12)]
PointsImageTransformed = zeros(3,11);
for i = 1:11
  PointsImageTransformed(:,i) = TransformationMatrix*[PointsRealX(i); PointsRealY(i); PointsRealZ(i); 1];
  PointsImageTransformed(:,i) = PointsImageTransformed(:,i) / PointsImageTransformed(3,i);
endfor
PointsImageTransformed = round(PointsImageTransformed(1:2,:))