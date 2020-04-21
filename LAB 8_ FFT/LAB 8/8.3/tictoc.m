function y = tictoc();

    direc=zeros(10,1);
    radix2=zeros(10,1);
    fastft=zeros(10,1);

    for m=1:10
        x= 10*rand(2^m,1);  
        
        tic
        directdft(x);
        b=toc;
        direc(m)=b;
    
        tic
        radix2fft(x);
        b=toc;
        radix2(m)=b;

        tic
        fft(x);
        b=toc;
        fastft(m)=b;
    end
    plot(direc,'r');
    hold on;
    plot(radix2,'g');
    hold on;
    plot(fastft,'b');
end