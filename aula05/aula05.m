clear;
close all;
clc;

%% Ex2
% a)
Ta = 0.2;
t = 0:Ta:5-Ta;
x =  sin(2*pi*t);

[xi, txi] = ReconstroiSinal(x, Ta);
figure(1);
plot(t, x, 'r', txi, xi, 'b');
grid on;

% b)
Ta = 0.04;
t = 0:Ta:5-Ta;
y = sin(10*pi*t) + cos(12*pi*t) + cos(14*pi*t - pi/4);

[yi, tyi] = ReconstroiSinal(y, Ta);
figure(2);
plot(t, y, 'r', tyi, yi, 'b');
grid on;

% c)
Ta = 0.1;
t = -5:Ta:5-Ta;
z = sinc(5*t);

[zi, tzi] = ReconstroiSinal(z, Ta);
figure(3);
plot(t, z, 'r', tzi, zi, 'b');
grid on;

%% Ex3
A = imread('Parede.jpg');

A2 = A(1:2:end, 1:2:end, :);
A4 = A(1:4:end, 1:4:end, :);
A8 = A(1:8:end, 1:8:end, :);
A16 = A(1:16:end, 1:16:end, :);

figure(4);
subplot(2, 2, 1);
imshow(A2);
subplot(2, 2, 2);
imshow(A4);
subplot(2, 2, 3);
imshow(A8);
subplot(2, 2, 4);
imshow(A16);

%% Ex1
clear;
% a)
Ta = 0.01;
x1 = 0:Ta:5-Ta;
x2 = 0:Ta:5-Ta;
y = zeros(length(x1), length(x2));
for i = 1:length(x1)
    y(i, :) = cos(2*pi*(x1(i)-2*x2));
end
figure(5);
imshow(y);

% b)
Ta = 0.01;
x1 = -5:Ta:5-Ta;
x2 = -5:Ta:5-Ta;
y = zeros(length(x1), length(x2));
for i = 1:length(x1)
    z(i, :) = cos(2*pi*sqrt(x1(i)^2+x2.^2));
end
figure(6);
imshow(z);