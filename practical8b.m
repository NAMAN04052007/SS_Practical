clc;
clear;
close all;

t = -10:0.01:10;
w = -10:0.1:10;

x1 = sin(t);
x2 = cos(t);
x3 = sign(t);

x4 = zeros(size(t));
x4(t >= 0) = t(t >= 0);

x5 = exp(-abs(t));

X1 = zeros(size(w));
X2 = zeros(size(w));
X3 = zeros(size(w));
X4 = zeros(size(w));
X5 = zeros(size(w));

for k = 1:length(w)
    X1(k) = sum(x1.*exp(-1j*w(k)*t))*0.01;
    X2(k) = sum(x2.*exp(-1j*w(k)*t))*0.01;
    X3(k) = sum(x3.*exp(-1j*w(k)*t))*0.01;
    X4(k) = sum(x4.*exp(-1j*w(k)*t))*0.01;
    X5(k) = sum(x5.*exp(-1j*w(k)*t))*0.01;
end

figure(1);

subplot(2,1,1);
plot(t,x1);
title('Sine Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X1);
title('Fourier Transform of Sine');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;

figure(2);

subplot(2,1,1);
plot(t,x2);
title('Cosine Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X2);
title('Fourier Transform of Cosine');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;

figure(3);

subplot(2,1,1);
plot(t,x3);
title('Signum Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X3);
title('Fourier Transform of Signum');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;

figure(4);

subplot(2,1,1);
plot(t,x4);
title('Ramp Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X4);
title('Fourier Transform of Ramp');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;

figure(5);

subplot(2,1,1);
plot(t,x5);
title('Exponential Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(w,X5);
title('Fourier Transform of Exponential');
xlabel('Frequency (rad/s)');
ylabel('X(w)');
grid on;
