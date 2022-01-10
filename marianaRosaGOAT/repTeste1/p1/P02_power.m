function [P,n] = P02_power(x,T,Ta)
  if nargin < 2
    T = 1;
  end
  if nargin < 3
    Ta = 0.01;
  end
  n = round(T/Ta);
  if length(x) >= n
    P=sum(x(1:n).^2)/n;
  else
    P=NaN;
  end
end
