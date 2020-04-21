%ANSWER TO PART b: When you sample the DTFT at different frequencies (2*pi*k/N) you will get the ideal filter samples. 
%ANSWER TO PART C: As N is increased, the filter comes closer and closer to the ideal filter representation.

function h = type1_dft(N,wc)
M=(N-1)/2;
% Create vector of equally-spaced frequencies
w= 0:0.01:2*pi; 
w1=0: (2*pi)/N: (2*pi)*(N-1)/N;
% Create ideal amplitude response of low-pass filter (remember, it should be symmetric about w = pi)
for i = 0: 1 : N-1
	if( ( ( (2*pi)/N)*i)<wc |  ( ( (2*pi)/N)*i)>2*pi-wc)
		Ad(i+1)=1;
	else
		Ad(i+1)=0;
	end
end
% Compute linear phase vector using correct slope
phi = exp(-j*M*w1);
% Compute ideal frequency samples as product of Ad and phi
H = phi.*Ad;
% Compute filter taps via inverse DFT
h = ifft(H);
% Make result real 00=to get rid of near-zero imaginary parts
H1= fft(h,1000);
h = real(h);
% Plot impulse response, magnitude response, and phase response over a finer frequency grid
subplot(3,1,1)
plot(h); 
title("Impulse response");
subplot(3,1,2)
plot(abs(H1)); 
title("magnitude response");
subplot(3,1,3)
plot(angle(H1));
title("phase response");
end


