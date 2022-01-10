N=1000;
N4=N/4;
x=[0:N4-1 N4:-1:1-N4 -N4:-1]/N4;
T=1;
Ta=T/N;
K=100;
[a,b]=P03_t5(x,K,T,Ta);
figure(1);
for k=1:K
  P03_t3(10*Ta,1/T,2,a(1:k),b(1:k));
  drawnow
  pause(0.1);
end
