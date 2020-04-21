function asdf= ApproxxError(T,T1)
t=-T1:.001:T1
pulse=rectangularPulse(-T1,T1,t);
err=0;
maxerr=zeros(101);
abserr=zeros(101);
for N=1:101
	y=squareFS(T,T1,t,N);
	for k=1:2*N+1
		err=(y(k)-pulse(k));
		if (err>maxerr(N))
			maxerr(N)=abs(err);
		end
		abserr(N)=abserr(N)+err*err;
	end
	abserr(N)=abserr(N)/(2*N+1);

end

N=1:101
plot(N,abserr,'-',N,maxerr,'--');


