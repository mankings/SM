%exercicio 1
%Name: Mariana Rosa

%%
%Clear

clear all;
close all;
clc;

%%
%a)
figure(1)  %abre uma nova janela
Ta=0.01;
t=[0:Ta:5]'; %domínio de 0, Ta em Ta até 5
x= 2*sin(2*pi*t) %função
subplot(2,2,1) %subplot(m, n, nº do grafico)
plot(t,x, '-r'); %plot (abcissas, ordeniadas)para criar o grafico
title('Ex1 Alínea A');

%b)
y=cos(10*pi*t);
subplot(2,2,2);         
plot(t,y);               
title('Ex1 Alínea B');

%c)

z= x.*y;
%esta operacao é uma ponto a ponto, ou seja, temos de (.* ./ .^)
%operacoes ponto a ponto entre vetores linha e coluna resulta de uma matriz
%[x1y1 x1y2...] EMBORA NÃO DÊ ERRO É UM ERRO MATEMATICO!
%se for operaçoes + e - não precisa desse ponto
subplot(2,2,3);
plot(t,z)
title('Ex1 Alínea C');


%e)

t1=[0:Ta:5]';
t2=[0:Ta:5]';
[T1, T2] = meshgrid(t1,t2) %meshgrid basicamente faz matrizes do  msm tamnho para poder multiplicare
%matriz com #t2 linhsa e #t1 colunas
                           
figure(2)
q=2*sin(2*pi*(2*T1+T2));
surf(T1,T2,q, 'EdgeColor', 'r');     %em alterantiva podemos usar mesh()
                                        %surf une pontos por linha preta e
                                        %pinta superficie
                                        %EdgeColor muda cor da linha
title('Ex1 Alínea E (surf c/ bordas e superfície)')

figure(3)
mesh(T1,T2,q);                      %=surf, com bordas sólidas mas sem superfície
title('Ex1 Alínea E (mesh c/ bordas mas sem superfície)')


%%
%Ex 3
%representar simultaneamente
figure(9);
Ta=0.01;
t=0:Ta:5;
x=2*sin(4*pi*t);  
plot(t,x, 'r', 'LineWidth', 1)
hold on         % hold on retains plots in the current axes so that new plots added to the axes do not delete existing plots
y=cos(10*pi*t);
plot(t,y, 'b--', 'LineWidth', 3)  
z=x.*y;
plot(t,z, 'g-o', 'LineWidth', 1)
t=0:Ta:10;
w=3*sin(pi*t)+2*sin(6*pi*t);
plot(t,w, 'y', 'LineWidth', 3)
hold off        % hold off sets the hold state to off so that new plots added to the axes clear existing plots and reset all axes properties
xlabel('X');    % legenda para o eixo das abcissas
ylabel('Y');    % legenda para o eixo das ordenadas
title('Exercício 3');

%% Ex 4

figure(10)
mesh(T1,T2,q);                 %mesh une pontos sem pintar superficie (!= do surf)
colormap('gray');
title('Exercício 4');
legend('Q');
xlabel('X');
ylabel('Y');
zlabel('Z');

%% Ex 5

figure(11);
Ta=1/24;
t=[0:Ta:5]';
x1=-5:0.05:5;
x2=-5:0.05:5;
[X1,X2,T]=meshgrid(x1,x2,t);
for k=1: length(t)
    r=2*sin(2*pi*sqrt(X1.^2+X2.^2)-2*pi*T);
    frame=r(:,:,k) %vai projetando eixos x e y no plano z
    imagesc(frame); %mostra dados do array como uma imagem
    pause(Ta);
end