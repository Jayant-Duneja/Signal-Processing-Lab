%LTI system with response 1/(1+jw)
function f=Lti_c(A,t) 
in=partialfouriersum(A,2*pi,t);
N=(length(A)-1)/2; 
for x=1:length(A) 
	w=x-N-1;
	A(x)=A(x)/(1+j*w);
end 
B=A;
y=partialfouriersum(B,2*pi,t); 
subplot(2,1,1);
plot(t,y);
title("Output when 1/(1+jw) applied (c):");
subplot(2,1,2);
plot(t,in);
title("Input:");
end