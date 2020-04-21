function y = ten3b(N)
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

    sig=Synthesizer( [100 150 200 250], [2 2 2 2], [1 5 1 5], [1 1 1/2 1 1], 48000);
    sig=sig';
    plot(sig);
    figure();

    w5=ones(N,1);
    h1=h.*w5;
    g1=g.*w5;
    H1=fftshift(fft(h1,N));
    G1=fftshift(fft(g1,N));

    siglpf=conv(sig,h1);
    sighpf=conv(sig,g1);
    subplot(3,1,1);
    plot(abs(fftshift(fft(siglpf))));
    subplot(3,1,2);
    plot(abs(fftshift(fft(sighpf))));
    subplot(3,1,3);
    plot(abs(fftshift(fft(sig))));