N=500;
K=20;
Ta=0.001;
t=(0:N-1)*Ta;
x=zeros(1,N);
F=zeros(1,K);
for k=1:K
  F(k)=1+19*rand();
  x=x+sin(2*pi*F(k)*t);
end
[X0,f]=P04_t1(x,Ta,0);
X1=P04_t1(x,Ta,1);

%figure(1);
%plot(t,x);
figure(2);
subplot(2,1,1);
plot(f,abs(X0),'-o',[-F F],-ones(1,2*K),'xk');
subplot(2,1,2);
plot(f,abs(X1),'-o',[-F F],-ones(1,2*K),'xk');
