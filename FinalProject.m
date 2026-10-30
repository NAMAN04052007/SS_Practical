clc;
clear;
close all;

% A30 - Energy Spectral Density Analyzer
% x(t) = e^(-2t)u(t)

% Time values
dt = 0.001;
t = 0:dt:8;

% Given signal
x = exp(-2*t);

% Analytical ESD
f = -5:0.001:5;

X = 1./(2 + 1j*2*pi*f);
ESD = abs(X).^2;

% FFT of signal
N = length(x);

X_fft = fft(x)*dt;
X_fft = fftshift(X_fft);

f_fft = (-N/2:N/2-1)/(N*dt);

ESD_fft = abs(X_fft).^2;

% Plot signal
figure;
plot(t,x);
grid on;
xlabel('Time (sec)');
ylabel('x(t)');
title('Signal x(t) = e^{-2t}u(t)');

% Plot ESD
figure;
plot(f,ESD,'LineWidth',1.5);
hold on;
plot(f_fft,ESD_fft,'--');
grid on;

xlabel('Frequency (Hz)');
ylabel('ESD');
title('Energy Spectral Density');

legend('Analytical','FFT');
xlim([-5 5]);

% Energy using time domain
E_time = trapz(t,x.^2);

% Energy using frequency domain
E_freq = trapz(f_fft,ESD_fft);

% Theoretical energy
E_theory = 1/4;

% Error
error = abs(E_time-E_freq)/E_theory*100;

% Energy bandwidth
B90 = tan(0.90*pi/2)/pi;
B95 = tan(0.95*pi/2)/pi;
B99 = tan(0.99*pi/2)/pi;

% Two-sided bandwidth
BW90 = 2*B90;
BW95 = 2*B95;
BW99 = 2*B99;

% 3 dB bandwidth
f3 = 1/pi;
BW3 = 2*f3;

% Display results
fprintf('\n');
fprintf('Energy Spectral Density Analyzer\n');
fprintf('---------------------------------\n');

fprintf('Theoretical Energy = %.4f\n',E_theory);
fprintf('Time Domain Energy = %.4f\n',E_time);
fprintf('Frequency Domain Energy = %.4f\n',E_freq);
fprintf('Error = %.4f %%\n',error);

fprintf('\nEnergy Bandwidth:\n');
fprintf('90%% = %.4f Hz\n',BW90);
fprintf('95%% = %.4f Hz\n',BW95);
fprintf('99%% = %.4f Hz\n',BW99);

fprintf('\n3 dB Bandwidth = %.4f Hz\n',BW3);

% Cumulative energy plot
fp = f(f>=0);
ep = ESD(f>=0);

cumE = 2*cumtrapz(fp,ep);
percentage = cumE/E_theory*100;

figure;
plot(fp,percentage);
grid on;

xlabel('Frequency (Hz)');
ylabel('Energy (%)');
title('Cumulative Energy');

ylim([0 100]);
xlim([0 5]);