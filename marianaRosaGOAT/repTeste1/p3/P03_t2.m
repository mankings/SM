f1=3000/1.0; A1=1; phi1=2*pi*rand-pi;
f2=3000/1.1; A2=1; phi2=2*pi*rand-pi;
f3=3000/1.2; A3=1; phi3=2*pi*rand-pi;

Ta=1e-6;
D=1000000*Ta;
t=0:Ta:D;
x=A1*sin(2*pi*f1*t+phi1)...
 +A2*sin(2*pi*f2*t+phi2)...
 +A3*sin(2*pi*f3*t+phi3);
%plot(t,x);
%hold on;
(x*x')/length(x)
  
