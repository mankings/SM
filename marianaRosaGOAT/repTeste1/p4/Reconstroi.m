
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

