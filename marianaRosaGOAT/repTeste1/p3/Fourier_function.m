%%
%clear
%%
%Ex. 3

Ta=0.001;
f0=1;
Np=10;

%do exercicio 2
bk = [0 4/pi 0 4/(3*pi) 0 4/(5*pi) 0 4/(7*pi)]
ak = zeros(size(bk));

[x,t]= Fourier_functions(Ta,f0,Np,ak,bk);
figure(1)
plot(t,x);
title('Ex 3')
xlabel('tempo(s)')
ylabel ('Amplitude')

 
%%Ex4
%funcao par pq simetrico relativo às ordenadas

bk=[0 0 0 0 0]
ak=[1 0.5 0.25 0.125 0.0625]

[x,t]= Fourier_functions(Ta,f0,Np,ak,bk);
figure(2)
plot(t,x);
title('Ex 4 par')
xlabel('tempo(s)')
ylabel ('Amplitude')

%%
%funcao impar, como podemos observar pelo simétrico relativamente à origem

ak=[0 0 0 0 0]
bk=[1 0.5 0.25 0.125 0.0625]

[x,t]= Fourier_functions(Ta,f0,Np,ak,bk);
figure(2)
plot(t,x);
title('Ex 4 impar')
xlabel('tempo(s)')
ylabel ('Amplitude')


%% Exercício 5
clear all

% código para testar a função coeficientes
Ta = 0.001;
T = 1;
K = 10;
t = (0: Ta : 5*T);
%%x = random("uniform",-10, 10, length(t), 1);
x= square(2*pi*t)';

[ak,bk] = coeficientes(Ta, T, x, K);
ak
bk
 
% gráficos
[y,ty]=Fourier_functions(Ta, 1/T, 5 ,ak ,bk);
plot(t,x, ty,y, 'r');
xlabel("Tempo");
ylabel("Série de fourier");
title("Ex 5 pela funcão fourier");
%%
function [ak,bk] = coeficientes(Ta, T, x, K)
N = length(x);
t=[0:Ta:(N-1)*Ta]';

% determinar ak
ak = zeros(1,K);

for k = 1 : K %k-1 corresponde a freq 0 
    ak(k) =  (sum(x .* cos(2*pi*(k-1)*1/T*t)) * 2)/N;
end
%operacao elemento a elemento - .*
% determinar bk
bk = zeros(1,K);
for k = 1 : K
    bk(k) = (sum(x .* sin(2*pi*(k-1)*1/T*t)) * 2 )/N ;
end

end
%% function

function [x,t] = Fourier_functions(Ta, f0,Np, ak,bk)
    % assim está errado, não podemos restringir o periodo assim t=[0:Ta:1];
    t=[0:Ta:(Np*(1/f0)-Ta)]';
    x= zeros(size(t));
    
    for i=1:length(ak) %soma das fouriers
        x = x + (ak(i)*cos(2*pi*(i-1)*f0*t)) + bk(i)*sin(2*pi*(i-1)*f0*t);
    end 
    
        
end