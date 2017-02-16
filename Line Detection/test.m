theta = (0:360);
d = -max_p:max_p-1;
imshow(uint8(Hough_Matrix),[],'xdata',theta,'ydata',d);
xlabel('\theta'),ylabel('P')
axis on, axis normal;
title('P\theta - SPACE');