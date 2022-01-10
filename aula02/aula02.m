clear;
close all;
clc;

%% ex1
fs = 2*8*10;
T = 6;
Ta = 1/fs;
t = 0:Ta:T-Ta;

x = 2*sin(4*pi*t);
Tx = 1/2;

y = sin(10*pi*t + pi/2);
Ty = 1/5;

z = sin(6*pi*t) + sin(8*pi*t);
Tz = 1;

w = sin(6*pi*t) + sin(8*pi*t + 0.1);
Tw = 1;

q = sin(6*pi*t) + sin(7*pi*t) + sin(8*pi*t);
Tq = 2;

plot(t, x, 'r', t, y, 'y', t, z, 'g', t, w, 'b', t, q, 'c', LineWidth=2);
xlabel('Time (s)');
ylabel('Signals');
grid on;

%% ex3
powerx = signalPowerRect(x, Ta, T)
powery = signalPowerRect(y, Ta, T)
powerz = signalPowerRect(z, Ta, T)
powerw = signalPowerRect(w, Ta, T)
powerq = signalPowerRect(q, Ta, T)

%% ex4
clear;
clc;

max = pi;
min = -pi;

fs = 2*8*10;
T = 22;
Ta = 1/fs;
t = 0:Ta:T-Ta;

f1 = 3;
f2 = 3/1.1;
f3 = 3/1.2;

figure(1);
xlabel('Time (s)');
ylabel('Signal');
title('Ex4');
grid on;

hold on;
for i = 0:5 %seis iterações do sinal
    r = (max-min)*rand(1, 3) + min; %gerar fases entre -pi e pi aleatórias
    wave = sin(2*pi*f1*t + r(1)) + sin(2*pi*f2*t + r(2)) + sin(2*pi*f3*t + r(3));
    signalPowerRect(wave, Ta, T)
    plot(t, wave);
end
hold off;
