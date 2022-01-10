clear all
close all
clc

Ta = 0.01;
Ta = 0.1;

%% 01.1
t_5 = (0:Ta:5)'; % column vector
x = 2*sin(4*pi*t_5);
y = cos(10*pi*t_5);
z = x.*y;
t_10 = (0:Ta:10)';
w = 3*sin(pi*t_10) + 2*sin(6*pi*t_10);
%q = zeros(length(t5),length(t5));
%for i=1:length(t5)
%  for j=1:length(t5)
%    q(i,j)=2*sin(2*pi*(2*t5(i)+t5(j)));
%  end
%end
q = 2*sin(2*pi*(2*repmat(t_5,1,length(t_5))+ ... % replicate columns
                  repmat(t_5',length(t_5),1) ... % replicate rows
               )); % t1 in the rows, t2 in the columns
whos

%% 01.2
figure;
plot(t_5,x);
grid on;
xlabel('time');
ylabel('amplitude');
title('01.2 --- x(t)');
figure;
plot(t_5,y);
grid on;
xlabel('time');
ylabel('amplitude');
title('01.2 --- y(t)');
figure;
plot(t_5,z);
grid on;
xlabel('time');
ylabel('amplitude');
title('01.2 --- z(t)');
figure;
plot(t_10,w);
grid on;
xlabel('time');
ylabel('amplitude');
title('01.2 --- w(t)');
figure;
mesh(t_5,t_5,q);
xlabel('t_1');
ylabel('t_2');
zlabel('amplitude');
title('01.2 --- q(t_1,t_2)');

%% 01.3
figure;
plot(t_5,x,'-r');
grid on;
hold on;
plot(t_5,y,'--b','linewidth',2);
plot(t_5,z,'.-g');
plot(t_10,w,'-','linewidth',2,'color',[0.7 0.7 0]); % darker yellow
hold off;
xlabel('time');
ylabel('amplitude');
legend('x(t)','y(t)','z(t)','w(t)');
title('01.3 --- w(t), y(t), z(t), w(t)');

%% 01.4
figure;
mesh(t_5,t_5,q);
n_levels=64;
colormap(repmat((0:1:n_levels-1)'/(n_levels-1),1,3));
colorbar
view(2); % view it from above
xlabel('t_1');
ylabel('t_2');
zlabel('amplitude');
title('01.4 --- q(t_1,t_2)');

%% 01.5
Ta = 1/25;
Tx = 0.1;
x1 = (-5:Tx:5)'; % column vector
x2 = (-5:Tx:5);  % row vector
x1r = repmat(x1,1,length(x2)); % replicate columns (each line has a constant value)
x2r = repmat(x2,length(x1),1); % replicate rows (each column has a constant value)
a = 2*pi*sqrt(x1.^2+x2.^2);%+atan2(x2,x1);
figure;
for t=0:Ta:5
  tic;
  mesh(x1,x2,2*sin(a-2*pi*t));
  axis('equal');
  view(2);
  drawnow
  pause(max(0.001,min(0.1,Ta-toc))); % neither too slow nor too fast
end
