function y = Synthesizer(notes,durs,harmamps,adsr,fs)
% Initialize output as empty
y = []; tdisp=[];
% Loop over the notes
for i=1:length(notes)
	% Compute the time vector and ADSR envelope for this note
	[t,e] = envelope(fs,adsr(1)/durs(i),adsr(2)/durs(i),adsr(3)/durs(i),adsr(4)/durs(i),adsr(5)/durs(i));
	% Compute the sum of harmonics for this note
	h = harmonics(t,notes(i),harmamps(i),zeros(1,length(notes)));
	% Modulate the sum of harmonics with the envelope
	n = h.*e;
	% Add the note to the sequence
	y = [y,n];
	tdisp = [tdisp, t+durs(i)*i]; %t+durs(i)*i to appropriately shift the output time vector
end

%play and plot sound
plot(tdisp,y);
sound(y,fs);
end