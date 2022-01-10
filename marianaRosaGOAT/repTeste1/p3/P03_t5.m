function [a,b] = P03_t5(x,K,T0,Ta)
  if nargin < 4
    Ta = 0.001;
  end
  if nargin < 3
    T0 = 1;
  end
  if nargin < 2
    K = 10;
  end
  N = round(T0/Ta);
  x = x(1:N);
  t = 2*pi*(0:N-1)/N;
  a = zeros(1,K);
  b = zeros(1,K);
  for k=1:K
    a(k) = 2/N*sum(x.*cos(k*t));
    b(k) = 2/N*sum(x.*sin(k*t));
  end
end
