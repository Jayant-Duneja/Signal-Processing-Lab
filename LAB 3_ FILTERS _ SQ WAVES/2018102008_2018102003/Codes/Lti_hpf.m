%High Pass Filter
function f=Lti_hpf(A,t) 
in=partialfouriersum(A,2*pi,t);
N=(length(A)-1)/2; 
for x=N-2:N+4 
	A(x)=0;
end 
B=A;
y=partialfouriersum(B,2*pi,t); 
subplot(2,1,1);
plot(t,y);
title("Output when HPF applied (b):");
subplot(2,1,2);
plot(t,in);
title('Input:');
end