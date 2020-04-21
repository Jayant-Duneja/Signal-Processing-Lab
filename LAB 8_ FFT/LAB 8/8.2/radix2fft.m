function X = radix2fft(x);
    N=length(x);
    Wn=exp((-i)*2*pi/N);
    if ~isequal(unique(factor(N)),2)
        error('N is not a power of 2!');
    end
    if N == 2
        X(1)=x(1)+x(2);
        X(2)=x(1)-x(2);
    else
        for(k=1:2:N)
            x_even((k+1)/2)=x(k);
        end

        for(k=2:2:N)
            x_odd(k/2)=x(k);
        end

        X_even=zeros(N/2,1);
        X_odd=zeros(N/2,1);

        X_even=radix2fft(x_even);
        X_odd=radix2fft(x_odd);

        for(k= 1: N/2)
            X(k)=X_even(k) + X_odd(k)*Wn^(k-1);
        end
        for(k= N/2+1 : N) 
            X(k)=X_even(k - (N/2)) - X_odd(k - (N/2))*Wn^(k-1-N/2);
        end
    end
end
