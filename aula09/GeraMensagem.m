function [NumBits,NumBPS] = GeraMensagem(f,CompMesg,nBits)
    f = f/sum(F);
    NumBits = 0;

    for k = 1:CompMesg
        q = rand();
        i = sum(q > cumsum(f)) + 1;
        NumBits = NumBits + nBits(i);
    end

    NumBPS = NumBits / CompMesg;
end