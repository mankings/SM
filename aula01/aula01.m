clear;
close all;
clc;

%% ex1
Ta = 0.01;
t = 0:Ta:5;
x = 2*sin(4*pi*t);
y = cos(10*pi*t);
z = x.*y;

tw = 0:Ta:10;
w = 3*sin(pi*tw) + 2*sin(6*pi*tw);

t1 = 0:Ta:5;
t2 = 0:Ta:5;
[T1, T2] = meshgrid(t2, t1);
q = 2*sin(2*pi*(2*T1 + T2));

%% ex2
xplot = figure;
plot(t, x);
title('x');

yplot = figure;
plot(t, y);
title('y');

zplot = figure;
plot(t, z);
title('z');

wplot = figure;
plot(tw, w);
title('w');

qplot = figure;
mesh(t1, t2, q);
title('q');



%% ex3
plot3 = figure;
p = plot(t, x, 'r-', t, y, 'b--', t, z, 'g.-', tw, w, 'y-');
p(2).LineWidth = 2;
p(4).LineWidth = 2;

%% ex4
plot4 = figure;
surf(t1, t2, q, 'EdgeColor','none');
xlabel('Time (s)');
ylabel('Time (s)');
zlabel('Amplitude');
grid on;
cmap = colormap;
cmap_gray = repmat(linspace(0, 1, length(cmap))', 1, 3);
colormap(cmap_gray);

%% ex5
clear;

Ta = 1/25;
t = 0:Ta:5;
x1 = -5:Ta:5;
x2 = -5:Ta:5;
N = length(t);
N1 = length(x1);
r = zeros(N, N1);

for n = 1:N
    tic
    for i = 1:N1
        r(i, :) = 2*sin(2*pi*sqrt(x1(i)^2 + x2.^2)-2*pi*t(n));
    end
    mesh(x1, x2, r);
    view(2);
    drawnow();
    pause(Ta-toc); %quanto mais tempo demora o código, menos tempo fica paused, assim o tempo que fica paused é geralmente sempre o mesmo entre iterações
end