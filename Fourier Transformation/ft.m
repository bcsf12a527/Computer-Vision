close all;
clear all;
clc;

points = 50;
waves = 2;

x = 0:points;
y =sind(x*waves*360/points);
plot(x,50*y,'b--');

f = fft(y);

hold on
plot(x,real(f),'r*');
plot(x,imag(f),'g*');
plot(x,abs(f),'bo');
plot(x,atand(imag(f)/real(f)),'b+');
