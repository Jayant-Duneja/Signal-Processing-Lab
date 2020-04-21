function h = transitionband(N,wc,tbvals)
% Create vector of N equally-spaced frequencies
M=(N-1)/2;
w = 0: (2*pi)/N: (2*pi)*(N-1)/N;
% Create ideal amplitude response of low-pass filter (remember,
%it should be symmetric about w = pi)
for i = 0: 1 : N-1
	if( ( ( (2*pi)/N)*i)<wc |  ( ( (2*pi)/N)*i)>2*pi-wc)
		Ad(i+1)=1;
	else
		Ad(i+1)=0;
	end
end
% Determine which indices correspond to the samples just to the
% left and the right of the cutoff frequency (if cutoff freq
%falls exactly
% on a sample, use that sample and the one to the right).
wleftind = floor((wc*N)/(2*pi));
wrightind = wleftind + 1;
% Update amplitude response with given transition band values at
%these frequencies (remember the symmetry around pi);
Ad(wleftind+1) = tbvals(2);
Ad(wrightind+1) = tbvals(1);
Ad(N-wleftind) = tbvals(2);
Ad(N-wrightind) = tbvals(1);
%wrightind+1+(N-1)/2
stem(Ad); figure();

% Compute linear phase vector using correct slope
phi = exp(-j*M*w);
% Compute ideal frequency samples as product of Ad and phi
H = Ad.*phi;
% Compute filter taps via inverse DFT
h = ifft(H);
H1=fft(h,1024);
% Make result real to get rid of near-zero imaginary parts
h = real(h);
% Compute finely-spaced frequency response of designed filter
%[H,wfine] = freqz(h,1,1024);
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