function [t,e] = envelope(fs,a,d,s,dur,r)
	% In each phase of the signal, determine the corresponding piece of time vector and envelope.
	% Attack: signal linearly increases from 0 to 1 in a seconds
	t = 0:1/fs:a;
	e = t/a;
	% Decay: signal linearly decreases from 1 to s in d seconds
	tdelay = (a+1/fs):1/fs:a+d;
	t = [t, tdelay];
	e = [e, ((s-1)*(tdelay-a))/d+1];
	% Sustain: signal stays at s for dur seconds
	tsustain = a+d+1/fs: 1/fs :a+d+dur;
	t = [t, tsustain];  
	e = [e, s*ones(1,length(tsustain))];
	% Release: signal linearly decreases from s to 0 in r seconds
	trelease = a+d+dur+1/fs: 1/fs :a+d+dur+r;
	t = [t, trelease];
	e = [e, (-1)*s*(trelease-a-d-dur-r)/r];

	plot(t,e); 
end