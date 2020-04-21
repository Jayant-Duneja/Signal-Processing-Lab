function y = ten3(N)
    n= 1:500;
    sig=sin(0.3*pi*n) + sin(0.7*pi*n);

    sig1=conv(sig,ten2(N,1)); %hamming
    sig4=conv(sig,ten2(N,4)); %bartlett
    sig5=conv(sig,ten2(N,5)); %SQUARE

    subplot(4,2,1);
    plot(sig);
    title("original signal");
    subplot(4,2,2);
    plot(abs(fftshift(fft(sig,1000))));

    
    subplot(4,2,3);
    plot(sig1);
    title("hamming");
    subplot(4,2,4);
    plot(abs(fftshift(fft(sig1,1000))));


    subplot(4,2,5);
    plot(sig4);
    title("Bartlett");
    subplot(4,2,6);
    plot(abs(fftshift(fft(sig4,1000)))); 


    subplot(4,2,7);
    plot(sig5);
    title("rectangular");
    subplot(4,2,8);
    plot(abs(fftshift(fft(sig5,1000))));