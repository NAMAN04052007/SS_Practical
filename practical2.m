clc;
clear;
close all;

% Basic Signals
t = -10:0.5:10;

impulse = zeros(1,length(t));
[m,idx] = min(abs(t));
impulse(idx) = 1;

% unit step signal
ustep = zeros(1,length(t));
ustep(find(t >= 0)) = 1;

% ramp signal
r = t ;

% signum function
s = sign(t);

% Plotting Configuration 1
figure(1); % Equivalent to scf(0)
subplot(2,2,1);
stem(t, impulse);
title('Unit Impulse Signal');

subplot(2,2,2);
plot(t, ustep);
title('Unit Step Signal');

subplot(2,2,3);
plot(t, r);
title('Unit Ramp Signal');

subplot(2,2,4);
plot(t, s);
title('Signum Function');

t = -10:0.5:10;
 
% Time Shifting
u_shift = zeros(1,length(t)) + (t >= 2);  % Shifted unit step u(t-2)
u_shift2 = zeros(1,length(t)) + (t >= 3); % Shifted unit step u(t-3)
U_new = 1*(t >= 0) - 1*(t >= 3);          % Rectangular pulse
 
% Shifted unit ramp signal, r(t-2)
r = (t - 2) .* (t >= 2); 

% Time scaling r(2t)
r_2 = (2 * t) .* (t >= 0);

% Time reversal r(-t)
r_m = (-t) .* (t <= 0);

% Plotting Configuration 2
figure(2); % Equivalent to scf(1)
subplot(2,3,1);
plot(t, u_shift);
title('Shifted Unit Step u(t-2)'); 
 
subplot(2,3,2);
plot(t, u_shift2);
title('Shifted Unit Step u(t-3)'); 
 
subplot(2,3,3);
plot(t, r);
title('Shifted Unit Ramp r(t-2)');
 
subplot(2,3,4);
plot(t, r_2);
title('Time Scaled Ramp r(2t)');

subplot(2,3,5);
plot(t, r_m); % FIXED: Removed '*t' crash
title('Time Reversed Ramp r(-t)');
 
subplot(2,3,6);
plot(t, U_new);
title('Subtracted Signal (Pulse)');
