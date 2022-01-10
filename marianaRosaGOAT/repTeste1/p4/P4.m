%% Exercicio 2

%a)
figure(1);
freq=1;
T=1;
Ta=1/(freq*16);
t=[0:Ta:10*T-Ta]';


%função

x=sin(2*pi*t);
figure(1);

[X,fx]=Espectro(x,Ta,0);

%% b)

Ta=0.1;
t=[0:Ta:5-Ta]';

figure(2);
y= sin(10*pi*t)+cos(12*pi*t)+cos(14*pi*t-pi/4);
[Y,fy]= Espectro(y,Ta,0);

%% c)

Ta=00.1;
t=[0:Ta:5-Ta]';

z=zeros(length(t));
z(1:length(z)/2)=1;
figure(4);
plot(t,z);%como fica o grafico disto'

figure(3);
[Z,fz]=Espectro(z,Ta,0);

%% d)
Ta=0.01;
t1=[0:Ta:(0.25-Ta)]';
t2=[0:Ta:(0.75-Ta)]';
t3=[0:Ta:(1-Ta)]';

x1=(1/0.25)*t1;

b=0.5/0.25;
 
%% Ex.4

N=500;
Ta=0.001;
t=[0:N-1]*Ta;
x=0;

for i=1:20
    x=x+cos(rand()*20*2*pi*t + rand()*2*pi);
end

subplot(2,4,[1,2,3,4]);
plot(t,x);
title("Non-Periodic Sign Sequence");

subplot(2,4,[5,6]);
[XW,fXW] = Espectro(x,Ta,0);
title("Spectrum without Blackman Windowing");

subplot(2,4,[7,8]);
[XW,fXW] = Espectro(x,Ta,2);
title("Spectrum with Blackman Windowing") %n funciona

%% Ex. 5

