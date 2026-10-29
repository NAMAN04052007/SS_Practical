clc;
clear;
close all;

t = -10:0.01:10;

% Input signals
x1 = sin(t);
x2 = cos(t);

a = 2;
b = 3;

% 1. LINEARITY

% System: y(t) = 2*x(t)
y1 = 2*x1;
y2 = 2*x2;

% Combination of inputs
x = a*x1 + b*x2;

% Output of combined input
y = 2*x;

% Combination of individual outputs
y_check = a*y1 + b*y2;

figure;
plot(t,y,'LineWidth',1.5);
hold on;
plot(t,y_check,'--','LineWidth',1.5);

title('Verification of Linearity');
xlabel('Time');
ylabel('Amplitude');
legend('T{ax1+bx2}','aT{x1}+bT{x2}');
grid on;

if max(abs(y-y_check)) < 1e-10
    disp('System is Linear');
else
    disp('System is Non-Linear');
end


% 2. STABILITY

% Bounded input
x = sin(t);

% System: y(t) = 2*x(t)
y = 2*x;

figure;
plot(t,x,'LineWidth',1.5);
hold on;
plot(t,y,'LineWidth',1.5);

title('Verification of Stability');
xlabel('Time');
ylabel('Amplitude');
legend('Input x(t)','Output y(t)');
grid on;

if max(abs(y)) < Inf
    disp('System is Stable');
else
    disp('System is Unstable');
end



% 3. TIME INVARIANCE

% System: y(t) = 2*x(t)

x = sin(t);

% Original output
y = 2*x;

% Time shifted input x(t-3)
x_shift = sin(t-3);

% Output for shifted input
y1 = 2*x_shift;

% Shifted version of original output y(t-3)
y2 = 2*sin(t-3);

figure;
plot(t,y1,'LineWidth',1.5);
hold on;
plot(t,y2,'--','LineWidth',1.5);

title('Verification of Time Invariance');
xlabel('Time');
ylabel('Amplitude');
legend('T{x(t-3)}','y(t-3)');
grid on;

if max(abs(y1-y2)) < 1e-10
    disp('System is Time Invariant');
else
    disp('System is Time Variant');
end