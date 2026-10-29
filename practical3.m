clc;
clear;
close all;

% 1. Sine and Cosine Waves
t = -2:0.01:2;
A = 2;
f = 1;

x1 = A*sin(2*pi*f*t);
x2 = A*cos(2*pi*f*t);

figure(1);

subplot(2,1,1);
plot(t, x1, 'b');
xlabel('Time');
ylabel('Amplitude');
title('Sine Wave');
grid on;

subplot(2,1,2);
plot(t, x2, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Cosine Wave');
grid on;


% 2. Sinc Function
figure(2);

t1 = -10:0.01:10;
x3 = sin(pi*t1)./(pi*t1);
x3(t1 == 0) = 1;

plot(t1, x3, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Sinc Function');
grid on;


% 3. Triangular Waveform
figure(3);

t2 = -10:0.001:10;
triangle = 1 - abs(mod(t2,4)-2);
plot(t2,triangle, 'b');
xlabel('Time');
ylabel('Amplitude');
title('Triangular Wave');
grid on;


% 4. Rectangular Pulse
figure(4);

t3 = -10:0.01:10;
x5 = double(abs(t3) <= 2);

plot(t3, x5, 'b', 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
title('Rectangular Pulse');
grid on;


% 5. Sawtooth Waveform
figure(5);

t4 = -10:0.001:10;
x6 = 2*(mod(t4,4)/4)-1;

plot(t4, x6, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Sawtooth Wave');
grid on;


% 6. Decaying Exponential
figure(6);

t5 = 0:0.001:5;
a = -1;
x7 = exp(a*t5);

plot(t5, x7, 'b');
xlabel('Time');
ylabel('Amplitude');
title('Decaying Exponential');
grid on;


% 7. Increasing Exponential
figure(7);

t6 = 0:0.001:5;
a = 0.5;
x8 = exp(a*t6);

plot(t6, x8, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Increasing Exponential');
grid on;