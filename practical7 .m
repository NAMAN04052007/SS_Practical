clc;
close all;
clear ;
T = 2*pi;
omega = 2*pi/T;
t = linspace(0,4*pi,1000);
N = 10; % Harmonics
sq_wave = zeros(size(t));
for n = 1:2:N
    sq_wave = sq_wave + 4/(n*pi)*sin(n*omega*t);
    plot(t,sq_wave);
    hold on;
    pause(2);
end

figure(1);
plot(t,sq_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fourier Series Approximation of a Square Wave');
grid on;

hold off;
figure(2);
plot(t, square(omega*t), 'k--', 'LineWidth', 1.2);
hold on;
plot(t, sq_wave, 'b', 'LineWidth', 1.2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fourier Approximation Compared with Ideal Square Wave');
legend('Ideal Square Wave', 'Fourier Approximation');
grid on;

