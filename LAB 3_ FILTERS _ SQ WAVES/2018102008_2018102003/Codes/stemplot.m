%This generates the 'animated' stemplot
function y=stemplot(T1)
t=0:0.01:10;
	for T=1:0.2:5 
		N=round(2*T/T1);
		[A y]=squareFS(T,T1,t,N);
		subplot(2,1,1);
		stem(A); %Fourier Coefficients
		subplot(2,1,2);
		plot(t,y); %Actual signal
		pause(0.5);

end