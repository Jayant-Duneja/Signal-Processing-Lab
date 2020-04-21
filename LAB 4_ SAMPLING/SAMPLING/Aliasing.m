t_fine = 0:0.0001:2;
Ts1 = 0.1; Ts2 = 0.2; Ts3 = 0.3; 
T1 = 0:Ts1:2; T2 = 0:Ts2:2; T3 = 0:Ts3:2; 
xr1=0; xr2=0; xr3=0; 
xorig=cos(5*pi*t_fine);
x1=cos(5*pi*T1); x2=cos(5*pi*T2); x3=cos(5*pi*T3); 

for n=0:1:2/Ts1  
	xr1=xr1+(x1(n+1)*sinc((t_fine-n*Ts1)/Ts1)); 
end  
for n=0:1:2/Ts2  
	xr2=xr2+(x2(n+1)*sinc((t_fine-n*Ts2)/Ts2)); 
end  
for n=0:1:2/Ts3
	xr3=xr3+(x3(n+1)*sinc((t_fine-n*Ts3)/Ts3)); 
end 

subplot(3,1,1);
plot(t_fine,xr1,'-',t_fine,xorig,'--',T1,x1,'o'); 
title('When Ts=0.1')
subplot(3,1,2);
plot(t_fine,xr2,'-',t_fine,xorig,'--',T2,x2,'o');
title('When Ts=0.2')  
subplot(3,1,3); 
plot(t_fine,xr3,'-',t_fine,xorig,'--',T3,x3,'o'); 
title('When Ts=0.3') 
  
