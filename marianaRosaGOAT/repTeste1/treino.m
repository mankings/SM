%random ex
Ta=0.01;
t=[0:Ta:5-Ta]';
y=sin((2*pi*t)+pi/3)+cos((5*pi)-pi/4);
power_signed(y,0.01,length(t))
figure(1)
plot(t,y);

%%
Ta=0.01;
t=[0:Ta:5-Ta]';
y=2*cos(20*pi*t+pi/3);
figure(1)
plot(t,y);
figure(2)
plot(t,y.^2);

%%
Ta=0.01;
t=[0:Ta:5-Ta]';
z=sin(10*pi*t)+cos(10*pi*t+pi/2);
p = power_signed(z,Ta,t)


a= 2*sin(pi*t)+cos(2*pi*t);
ap=power_signed(a,Ta,t)

%%
c= 2*sin(pi*t)+2*cos(2*pi*t);
figure(2)
[X,f]=Espectro(c,0.001,0); %resulta [x,f]

H=zeros(size(c));
fc=2;
%Fc é a frequencia que vemos visualmente, a que queremos
H(f>-fc)=1;
H(f>fc)=0;


Y=H.*X; %aplicar o filtro no domínio da freq

%Filtracao Logica


figure(3)
[y,t]= Reconstroi(Y,f);
potenciaSinal=power_signed(y)

G=1-H;
Z= G.*X;
[z,t]=Reconstroi(Z,f);
potenciaRuido=power_signed(z)
%%
function potencia = power_signed(x,Ta,T)
     potencia = sum(x.^2)/length(x);
end
    function [X, f] = Espectro (x, Ta, w) 
     N= length(x);
     f0= 1/( N*Ta); %periodo= N*Ta
     fa=1/Ta;
     f=[-fa/2:fa/N:(fa/2-fa/N)]';
     
    
    %windowing
     if w~=0
        w=blackman(N);
        x=x*w;
    end
     
      
    X=fft(x);
    X=fftshift(X)/N;
     %vetor de N elementos
     
     
     plot( f, abs(X));
     xlabel('Frequency (Hz)');
     ylabel('|X(f)| Amplitude');
     grid;
     
    end
    
    
    function[x,t]= Reconstroi (X,f)
     N=length(X);
     fa=-f(1)*2;
     X = ifftshift(X);
    
     x = real( ifft(X)*N);
 
     fa = f(end)*2;
     Ta = 1/fa;
   
     t = [0: Ta: (N-1)*Ta]';
     plot(t, x);
     xlabel("Time (s)")
     ylabel("Magnitude")
    end