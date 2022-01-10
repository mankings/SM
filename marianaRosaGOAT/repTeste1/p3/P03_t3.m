function [x,t] = P03_t3(Ta,f0,Np,a,b)
  T0 = 1/f0; % período
  n = T0/Ta; % nº amostras num período
  N = Np*n;  % nº total de amostras
  t = (0:N-1)*Ta;
  x = zeros(1,N);
  for k=1:length(a)
    x = x+a(k)*cos(k*2*pi*f0*t);
  end
  for k=1:length(b)
    x = x+b(k)*sin(k*2*pi*f0*t);
  end
  if nargout == 0
    if N <= 10000
      plot(t,x,'o-','linewidth',2);
    end
  end
end
