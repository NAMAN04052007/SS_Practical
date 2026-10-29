
clc;
clear;
close all;

b = 1;
a = [1 -1];
n = 0:10;

% Using impz
h = impz(b,a,length(n));

figure(1);
stem(n,h);
title('Using impz');
grid on;

% Using filter
x = ones(size(n));
y = filter(b,a,x);

figure(2);
stem(n,y);
title('Using filter');
grid on;

% Using freqz
[H,w] = freqz(b,a,512);

figure(3);
plot(w,abs(H));
title('Using freqz - Magnitude Response');
xlabel('Frequency');
ylabel('Magnitude');
grid on;
