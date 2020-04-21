function y=cFreqResp(w);
%Calculate the frequency Response

x=zeros(length(w));
	x=1./( 1+0.9*exp((-j)*w) )
%Plotting the frequency Response
plot(w,x); 
title("Freq Response 6.3(d)");