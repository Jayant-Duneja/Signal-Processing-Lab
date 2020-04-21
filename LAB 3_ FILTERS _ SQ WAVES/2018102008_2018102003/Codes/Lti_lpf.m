%Low Pass Filter
function f=Lti_lpf(A,t) 
in=partialfouriersum(A,2*pi,t); %getting o/p
N=(length(A)-1)/2; 
for x=1:length(A) 
	if x>=N-2 && x<=N+4
	A(x)=A(x);
    else 
	A(x)=0; 
    end
end 
B=A;
y=partialfouriersum(B,2*pi,t); 
subplot(2,1,1);
plot(t,y);
title('Output when LPF applied (a):');
subplot(2,1,2);
plot(t,in);
title('Input:');
end