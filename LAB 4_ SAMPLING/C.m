%Generate t_fine, sampling time, original and samples of signal
t_fine = 0:0.0001:2;
Ts = 0.1;
T = 0:Ts:2; 
xr=0; 
xorig=1+sin(3*pi*t_fine)+cos(5*pi*t_fine);
x = 1+sin(3*pi*T)+cos(5*pi*T);

%Sinc reconstruction from samples of signal
for n=0:1:20  
	xr=xr+(x(n+1)*sinc(10*(t_fine-n*Ts))); 
end

%Plotting reconstructed and sampled signal
plot(t_fine,vq,'-',t_fine,xorig,'--',T,x,'o'); 
title('Sinc Interpolation')

%Calculating Mean Squared Error
err=xr-xorig;
err=err.*err;
err=sum(err); 
err=err/20000; 
disp(err); 
%Error in this part=0.0043


