function h1 = ten2(N,i)
    M=(N-1)/2;
    for n=1:N
        h(n)=sin(0.4*pi*(n-1-M)) / (pi*(n-1-M));
        if (n==M+1)
            h(n)=0.4;
        end
    end
    h=h'; 

    for a=1:N 
        g(a)=((-1)^a)*h(a);
    end
    g=g';
    

    if(i==1) %hamming
        w1=hamming(N);
        h1=h.*w1;
        g1=g.*w1;
        H1=fftshift(fft(h1,N));
        G1=fftshift(fft(g1,N));
    
    elseif(i==2) %hanning
        w2=hann(N);
        h1=h.*w2;
        g1=g.*w2;
        H1=fftshift(fft(h1,N));
        G1=fftshift(fft(g1,N));
        

    elseif(i==3) %blackman
        w3=blackman(N);
        h1=h.*w3;
        g1=g.*w3;
        H1=fftshift(fft(h1,N));
        G1=fftshift(fft(g1,N));
        
    elseif(i==4) %bartlett
        w4=bartlett(N);
        h1=h.*w4;
        g1=g.*w4;
        H1=fftshift(fft(h1,N));
        G1=fftshift(fft(g1,N));
       

    elseif(i==5) %rectangular
        w5=ones(N,1);
        h1=h.*w5;
        g1=g.*w5;
        H1=fftshift(fft(h1,N));
        G1=fftshift(fft(g1,N));
    end  

%{
    subplot(2,2,1);
    stem(h1);
    hold on
    plot(abs(H1));
    subplot(2,2,2);
    plot(angle(H1));
    title("Filter"); 
    subplot(2,2,3); 
    stem(g1);
    hold on
    plot(abs(G1));
    subplot(2,2,4);
    plot(angle(G1));
    title(" High Pass Filter ");
%}
end