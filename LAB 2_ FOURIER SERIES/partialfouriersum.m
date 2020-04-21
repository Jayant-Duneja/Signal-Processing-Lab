%Fourier Series Reconstruction
function y=partialfouriersum(A,T,t)
y=zeros(size(t));
N=(length(A)-1)/2; 
w=(2*pi)/T; %define fundamental freq 
for k=-N:N 
    y=y+A(k+1+N)*(exp(j*w*k*t)); %f.series reconstruction formula
end
end