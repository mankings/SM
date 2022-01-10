function [X, f] = Espectro (x, Ta, w)  %p estudar
     N= length(x);
     f0= 1/( N*Ta); %periodo= N*Ta
     fa=1/Ta;
     f=-fa/2:fa/N:(fa/2-fa/N);
     
    
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

% Espectro (x,0.1) %10*0.1

%𝑓𝑎/2 a +𝑓𝑎/2, onde 𝑓𝑎 = 1/𝑇a
    
%𝐗 – vetor da mesma dimensão de 𝐱, com os coeficientes da DFT de 𝑥(𝑡).
% 𝑓 – vetor da mesma dimensão de 𝐱, com as frequências (em Hz) de cada
% componente de X
%para calcular os Cks fft faz isso por nós

%% maneira ds
function [X,f] = SpectrumSMRemake (x, Ta, w, draw)
  
  if w
    x = x' .* blackman(length(x));
  endif
  
   N = length(x);
   X = fft(x)/N; %seja X um vetor de N amostras consecutivas de um sinal com um Ta
   %o vetor x vai ter N elementos, um coeficiente Ck para cada f da sua
   %decomposicao
   X = fftshift(X); %ordena
   
   fa = 1/Ta;
   df = 1/(N*Ta);
   f = [0:(N-1)]'*df - fa/2;
   
   if draw
     stem(f,abs(X));
     xlabel("Frequencia (Hz)");
     ylabel("DFT (Magnitude)");
   endif
   
   ends
