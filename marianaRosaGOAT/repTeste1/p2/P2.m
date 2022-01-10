%%
%Ex1 

%Clear

clear all;
close all;
clc;

%e)



Ta=0.0001;
t=[0:Ta:2];
f=(1/(2*pi));
e=2*cos(t+pi)+sqrt(2)*cos(t+pi*4)-(sqrt(2)*cos(t-pi/4));
figure(2)
plot(t,e);



q=sin(6*pi*t)+sin(7*pi*t)+sin(8*pi*t);
%       f=1/3     2/7        1/4
%descobrir o maximo divisor comum = 1
%axis para mudar 

max(q(:))
power_signed(q,t,Ta)

%%
%Ex 4

max=pi;
min=-pi;
Ta=5/200;
t= [0:Ta:2];
f1=3;
f2= 3/1.1;
f3=3/1.2;

hold on %pq queremos fazer vários graficos ao mesmo tempo

for i=1:3 %conta o ultimo
        %pi -(-pi)= 2pi - pi
    r= (max-min)*rand(1,3) + min %fase
    % o rand vai dar numeros aleatórios entre 0 1, mas nao queremos isso.
    % Ent multiplicamos por 2pi, mas fica superior então tiramos -pi.
    
   %cada x é uma linha no grafico
   %cada sin tem uma frequencia e um valor de r gerado anteriormente
   
   x=sin(2*pi*f1*t)+sin(2*pi*f2*t + r(2)) +sin(2*pi*f3*t + r(3));
   plot(t,x);
   
end
hold off



%% Ex 3


function potencia = power_signed(x,t,Ta)
     potencia = sum(x .^ 2) / length(t);
end