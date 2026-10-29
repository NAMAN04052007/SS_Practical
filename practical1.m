clc;
clear;
close;


t = 0:0.1:2*pi;
x = sin(t);
subplot(2,2,1);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title('sinewave');

t = 0:0.1:2*pi;
y = sin(5*t);
subplot(2,2,2);
plot(t,y);

t = 0:0.01:2*pi;
y2 = 2*sin(t);
subplot(2,2,3);
plot(t,y2);

y3 = 2*sin(5*t);
subplot(2,2,4);
plot(t,y3);