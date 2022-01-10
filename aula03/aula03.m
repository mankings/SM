clear;
close all;
clc;

%% Ex3
K = 100;
k = 1:K;
Ta = 0.01;
f = 1;
Np = 3;
ak = zeros(1, K)
bk = 2./(pi*k).*(1-cos(pi*k))

[x, t] = inv_fourier(Ta, f, Np, ak, bk);
figure();
plot(t, x);

%% Ex4
Ta = 0.01;
f = 1;
Np = 3;
ak = 4./(k*pi);
bk = zeros(1, K);
[x, t] = invFourier(Ta, f, Np, ak, bk);
figure();
plot(t, x);
title("Sinal Par");

Ta = 0.01;
f = 1;
Np = 3;
ak = zeros(1, K);
bk = 4./(k*pi);
[x, t] = invFourier(Ta, f, Np, ak, bk);
figure();
plot(t, x);
title("Sinal Ímpar");

%% Ex6
clear;
clc;
close all;

%--------- primeira onda
Ta = 0.001; %tempo de amostragem
T0 = 1; %período
T = 4; %duração
t = 0:Ta:T-Ta; %vetor tempo
phi = pi/2; %fase
M = 0; %média
A = 1; %amplitude

x = A*sawtooth(2*pi/T0*t+phi, 0.5) + M;

K = 20; %número de harmónicas a considerar
[ak, bk] = fourier(Ta, T0, x, K);

f0 = 1/T0; %frequencia
Np = T/T0; %número de períodos a considerar
[newX, t] = invFourier(Ta, f0, Np, ak, bk);

figure;
plot(t, x, 'b', LineWidth=1.5);
axis([0 4 -1.5 1.5]);
grid on;
figure;
plot(t, newX, 'b', LineWidth=1.5);
axis([0 4 -1.5 1.5]);
grid on;

%--------- segunda onda
clear;

Ta = 0.001;
T0 = 0.5;
T = 4;
t = 0:Ta:T-Ta;
phi = 0;
M = 0.5;
A = 0.5;

x = A*sawtooth(2*pi/T0*t+phi, 1) + M;

K = 20;
[ak, bk] = fourier(Ta, T0, x, K);

f0 = 1/T0;
Np = T/T0;
[newX, t] = invFourier(Ta, f0, Np, ak, bk);
newX = newX + M;

figure;
plot(t, x, 'r', LineWidth=1.5);
axis([0 4 -1.5 1.5]);
grid on;
figure;
plot(t, newX, 'r', LineWidth=1.5);
axis([0 4 -1.5 1.5]);
grid on;
