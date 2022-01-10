
close all;
clc;

Ta = 0.01; %10*1/1000
f0 = 1;
T0 = 1/f0;
N = 5;       %10-Ta
t = [0: Ta: (N*T0-Ta)]';
x = sin(2*pi*t);   %1 sin só pode ser oconstruido com um cosseno, por isso é que há freq de 1 hz e -1 temos riscas iguais

z=zeros(length(t));
z(1:length(z)/2)=1;


figure(1)
[X, f] = Espectro(x, 0.1, 0);

figure(3)
[X, f] = Espectro(z, 0.1, 0);


