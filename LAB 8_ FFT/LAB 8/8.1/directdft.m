function y = directdft(x);
    N=length(x);
    F=ones(N,N);
    Wn=exp((-i)*2*pi/N);
    for j=0:N-1
        for k=0:N-1
            F(j+1,k+1)= Wn^(j*k);
        end
    end
    X=F*x;
end