clc;
clear all;
close all;

points = 500;
waves = 1;

x = 0:points-1;
y = zeros(1,points);
y(waves+1) = 1;
%y(points-waves+1) = 1;

plot(x,y,'bo');

s = ifft(y);
hold on;
plot(x,200*s,'rx');
hold off;