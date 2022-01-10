[x,t]=GeraSinalFuncao(10000,0.001);
figure(1)
plot(t,x);
%Ex2


figure(2)
[X,f]=Espectro(x,0.001,0); %resulta [x,f]

H=zeros(size(x));
fc=3;
%filtracao logica, 
H(f>-fc)=1; %%mais seguro do que fazer H((f>-fc)&(f<fc))=1
H(f>fc)=0;

Y= H.*X; %vamos gerar um filtro no domínio da frequencia



figure(3)
[y,t]= Reconstroi(Y,f,0);
plot(t,x,t,y); %plot dos dois sinais sobrepostos, separamos sinal util e sinal com ruído.

% para ver o sinal ao contrario, a cena roxa inversa
G=1-H;
%Z= G.X;
%[z,t]=Reconstroi(z,f);

% Relacao sinal 



%%
function [x,t] = GeraSinalFuncao (N, Ta)
 
   %%%%%%%%%%
 
   t=[0: (N-1)]'*Ta; %um dos argumentos de saída
   rn1=random('normal', 0,pi,N,1);
   %garantir que existem duas coisas aleatórias diferentes
   rn2=random('normal', 0,pi,N,1);
   
   %alocar memória das nossas variáveis
   phi1= zeros(N,1); %vetor de amostras do integral de rn1 e rn2
   phi2=zeros(N,1);
   
   %se inicializassemos apenas como phi1=0, quando fose o ciclo,nao dava
   %certo, pq matlab vai criando memoria nova, vai sempre criando mais
   %espaço na memória e copia, sem necessidade nenhuma.Vai criando e
   %apagando, é má prática de programação. Demora mais tempo, processador
   %fica afetado.
   
   for k=2:N
       phi1(k)= phi1(k-1)+(rn1(k)+rn1(k-1))*Ta/2;
       phi2(k)= phi2(k-1)+(rn2(k)+rn2(k-1))*Ta/2;
   end
   
   r= 0.5*sin(20*pi*t+10*phi1)+0.5*sin(24*pi*t+10*phi2);

    x= sin(2*pi*t) +r;
    
end

%% Funcao Espetro
function [X, f] = Espectro (x, Ta, w)  %p estudar
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


%% Reconstroi

function[x,t]= Reconstroi (X,f,w)
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

%% Potencia

function potencia = power_signed(x,t,Ta)
     potencia = sum(x .^ 2) / length(t);
end