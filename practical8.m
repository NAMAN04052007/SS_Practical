clc;
clear;
close all;

t = -10:0.01:10;
w = -10:0.1:10;

x = zeros(size(t));
x(t >= 0) = 1;

X = zeros(size(w));

for k = 1:length(w)
    X(k) = sum(x .* exp(-1j*w(k)*t))*0.01;
end

figure(1);

subplot(2,1,1);
plot(t,x);
title('Unit Step Signal u(t)');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X);
title('Fourier Transform of Unit Step');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;

figure(2);
plot(w, abs(X), 'LineWidth', 1.2);
title('Magnitude Spectrum of Unit Step');
xlabel('Frequency (rad/s)');
ylabel('|X(w)|');
grid on;
