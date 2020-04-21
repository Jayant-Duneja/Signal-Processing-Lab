%Used to generate square wave coefficients
function [A y]=squareFS(T,T1,t,N) %t is a vectro
w=(2*pi)/T;
high=-T1:0.001:T1; %convert continuous time to discrete values
A=zeros(2*N+1); %A stores F.coefficients
for k=-N:N 
	for q=-T1:0.001:T1
		A(k+N+1)=A(k+N+1)+ exp(-1*w*j*k*q); 
	end
	A(k+N+1)=(A(k+N+1)*0.001)/T; %Account for scaling
end

%disp(A);
y=partialfouriersum(A,T,t); %Call F.Series deconstruction function

y=real(y);
pulse=rectangularPulse(-T1,T1,t); %Ideal rectangular pulse
plot(t,y,'-',t,pulse,'--'); 

end