clc;
clear ;
close all;
T = 2*pi; %period
t= -pi:0.0001:pi;
N =20; %No of harmonies
y = zeros(size(t));
for n = 1:2:N
    y = y+(4/pi)*(1/n)*sin(n*t); 
end
figure,plot(t,y);
title("Fourier Series Approximation Of Square Wave");
xlabel("Time(s)");
ylabel("Amplitude");
grid on;

y1 = zeros(size(t));
for n= 1:N
    y1= y1+(2/pi)*((-1)^n+1/n)*sin(n*t);
end
figure,plot(t,y1,'m');
title("Fourier Series Approximation Of Sawtooth Wave");
xlabel("Time(s)");
ylabel("Amplitude");
grid on;
y2 = 0;

for n = 1:2:N
    y2 = y2 + (8/pi^2)*(1/n^2)*cos(n*t);
end

figure
plot(t,y2,'r')
title("Fourier Series Approximation Of Triangular Wave")
xlabel("Time(s)")
ylabel("Amplitude")
grid on

