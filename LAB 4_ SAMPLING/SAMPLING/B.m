t_fine = 0:0.0001:2;
Ts = 0.1;
T = 0:Ts:2;
x = 1+sin(3*pi*T)+cos(5*pi*T);
xorig=1+sin(3*pi*t_fine)+cos(5*pi*t_fine);
vq=interp1(T,x,t_fine,'linear');  

plot(t_fine,vq,'-',t_fine,xorig,'--',T,x,'o'); 
title('Linear Interpolation')

err=vq-xorig;
err=err.*err;
err=sum(err); 
err=err/20000; 
disp(err);
%Error in this part=0.0259