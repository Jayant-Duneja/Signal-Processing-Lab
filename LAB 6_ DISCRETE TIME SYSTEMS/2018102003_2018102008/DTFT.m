function y=DTFT(x,no,w);
% Evaluate the DTFT sum directly for each of the w samples

X=zeros(1,length(w));
for n=1:length(x)
	X=X + x(n)*exp((-j)*w*(n-no));
end
disp(X);

% Plot the DTFT magnitude and phase
figure; 

subplot(211); plot(w, abs(X));
title("Magnitude");
subplot(212); plot(w, angle(X));
title("Phase");

% Plot the DTFT real and imaginary components
figure;

subplot(211); plot(w, real(X));
title("Real component");
subplot(212); plot(w, imag(X));
title("Imaginary component");

end
