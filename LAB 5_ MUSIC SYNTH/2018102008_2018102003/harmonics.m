function y=harmonics(t,fo,harmamps,harmphase) 
	y=zeros(size(t)); %initialize output
	fs=48000; %sampling frequency
	for i=1:length(harmamps) 
		y=y+harmamps(i)*sin(2*pi*i*fo*t + harmphase(i));
	end

	y=y/max(y(:))*0.95; %normalize output value

	%plot+hear generated signal
	plot(t,y);
	%sound(y,fs);
end	
