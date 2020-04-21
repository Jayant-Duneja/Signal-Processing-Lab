function y = eleven3(N)
	w=1:1:1000;
	sig=sin(0.4*pi*w) + sin(0.6*pi*w);
	sig1=conv(type1_dft(N,0.4*pi), sig);
	sig2=conv(transitionband(N,0.4*pi, [0.3 0.7]), sig);

	fsig=abs(fft(sig,1000));
	fsig1=abs(fft(sig1,1000));
	fsig2=abs(fft(sig2,1000));

	subplot(3,2,1)
	plot(sig);
	title("original signal");
	subplot(3,2,2)
	plot(fsig);
	title("FFTs:")

	subplot(3,2,3)
	plot(sig1);
	title("type1_dft");
	subplot(3,2,4)
	plot(fsig1);

	subplot(3,2,5)
	plot(sig2);
	title("transition band");	
	subplot(3,2,6)
	plot(fsig2);
