function y = ten1(N)
    w=hann(N);
    W=fftshift(fft(w,1001));
    Wd=20*log10(abs(W));

    x=ones(1,N);
    X=fftshift(fft(x,1001)); 
    Xd=20*log10(abs(X));

    y=bartlett(N);
    Y=fftshift(fft(y,1001)); 
    Yd=20*log10(abs(Y));

    z=hamming(N);
    Z=fftshift(fft(z,1001)); 
    Zd=20*log10(abs(Z));

    a=blackman(N);
    A=fftshift(fft(a,1001)); 
    Ad=20*log10(abs(A));

    subplot(5,2,1);
    stem(w); 
    title("hanning");
    subplot(5,2,2);
    plot(Wd);

    subplot(5,2,3);
    stem(x); 
    title("rect");
    subplot(5,2,4);
    plot(Xd);
    
    subplot(5,2,5);
    stem(y); 
    title("bartlett");
    subplot(5,2,6);
    plot(Yd);
    
    subplot(5,2,7);
    stem(z); 
    title("hamming");
    subplot(5,2,8);
    plot(Zd); 

    subplot(5,2,9);
    stem(a); 
    title("blackman");
    subplot(5,2,10);
    plot(Ad);
