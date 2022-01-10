clear all
close all
clc

screen = get(0,'screensize');
width = screen(3);
height = screen(4);

%% 02.1

Ta = 0.01;
T = 4;
t=0:Ta:T;
x = 2*sin(4*pi*t);                       Tx = 1/2;
[xMin,xMinIdx] = min(x); % minimum and index where it occurs
[xMax,xMaxIdx] = max(x); % maximum and index where it occurs
y = sin(10*pi*t+pi/2);                   Ty = 1/5;
yMin = min(y);
yMax = max(y);
z = sin(6*pi*t)+sin(8*pi*t);             Tz = 1;
zMin = min(z);
zMax = max(z);
w = sin(6*pi*t)+sin(8*pi*t+0.1);         Tw = 1;
wMin = min(w);
wMax = max(w);
q = sin(6*pi*t)+sin(7*pi*t)+sin(8*pi*t); Tq = 2;
qMin = min(q);
qMax = max(q);
fig = figure(1);
set(fig,'position',[60 20 width-80 height-140]);
subplot(5,1,1); plot(t,x,'b',t([xMinIdx xMaxIdx]),x([xMinIdx xMaxIdx]),'ok',repmat(0:Tx:T,2,1),1.2*max(abs(x))*[-1 1],'r'); grid on;
subplot(5,1,2); plot(t,y,'b',repmat(0:Ty:T,2,1),1.2*max(abs(y))*[-1 1],'r'); grid on;
subplot(5,1,3); plot(t,z,'b',repmat(0:Tz:T,2,1),1.2*max(abs(z))*[-1 1],'r'); grid on;
subplot(5,1,4); plot(t,w,'b',repmat(0:Tw:T,2,1),1.2*max(abs(w))*[-1 1],'r'); grid on;
subplot(5,1,5); plot(t,q,'b',repmat(0:Tq:T,2,1),1.2*max(abs(q))*[-1 1],'r'); grid on;

%% 02.1 z(t) extrema (outside the scope of SM)
% sin(6*pi*t)+sin(8*pi*t) -> (x^3-x^-3)+(x^4-x^.4), with x=exp(2i*pi*t)
pol = [-1 -1 0 0 0 0 0 1 1];
degree = (length(pol)-1)/2;
pol = pol .* (-degree:degree); % derivative
r = roots(pol);
subplot(5,1,3);
hold on;
for i=1:length(r)
  if abs(1-abs(r(i)))<1e-12
    tt = Tz*mod(angle(r(i))/(2*pi),1):Tz:T;
    plot(tt,sin(6*pi*tt)+sin(8*pi*tt),'ok');
  end
end
hold off;

%% 02.1 w(t) extrema (outside the scope of SM)
pol = [-exp(-1i*0.1) -1 0 0 0 0 0 1 exp(1i*0.1)];
degree = (length(pol)-1)/2;
pol = pol .* (-degree:degree); % derivative
r = roots(pol);
subplot(5,1,4);
hold on;
for i=1:length(r)
  if abs(1-abs(r(i)))<1e-12
    tt = Tw*mod(angle(r(i))/(2*pi),1):Tw:T;
    plot(tt,sin(6*pi*tt)+sin(8*pi*tt+0.1),'ok');
  end
end
hold off;

%% 02.1 q(t) extrema; here x=exp(1i*t) (outside the scope of SM)
pol = [-1 -1 -1 0 0 0 0 0 0 0 0 0 0 0 1 1 1];
degree = (length(pol)-1)/2;
pol = pol .* (-degree:degree); % derivative
r = roots(pol);
subplot(5,1,5);
hold on;
for i=1:length(r)
  if abs(1-abs(r(i)))<1e-12
    tt = Tq*mod(angle(r(i))/(2*pi),1):Tq:T;
    plot(tt,sin(6*pi*tt)+sin(7*pi*tt)+sin(8*pi*tt),'ok');
  end
end
hold off;
