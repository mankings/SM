clear;
close all;
clc;

%% Ex2
% a)
T = 1;
Ta = 0.01;
t = 0:Ta:(10*T-Ta);
x = sin(2*pi*t);
[X, fx] = espetro(x, Ta);

% b)
Ta = 0.01;
t = 0:Ta:5;
y = sin(10*pi*t) + cos(12*pi*t) + cos(14*pi*t - pi/4);
[Y, fy] = espetro(y, Ta);

% c)
Ta = 0.01;
f0 = 1;
t = 0:Ta:5;
phi = 0;
M = 0;
A = 1;
z = A*square(2*pi*f0*t + phi) + M;
[Z, fz] = espetro(z, Ta);

% d)
Ta = 0.01;
f0 = 1;
t = 0:Ta:5;
phi = 0;
M = 0;
A = 1;

q = A*sawtooth(2*pi*f0*t+phi, 0.5) + M;
[Q, fq] = espetro(q, Ta);

%% Ex4
clear;

N = 500;
Ta = 0.001;
t = 0:Ta:Ta*N-Ta;

n = 20;
f = randi(20, 1, n);
phi= 2*pi*rand([1, n]) - pi;
x = zeros(size(t));
for i = 1:n
    x = x + sin(2*pi*f(i)*t + phi(i));
end

figure(2);
plot(t, x);

[X, fx] = espetro(x, Ta);
[X, fx] = blackmanEspetro(x, Ta);