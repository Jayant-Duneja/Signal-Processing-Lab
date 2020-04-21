function y = overlapadd(h,x,N)

% If N is not already a power of 2, replace it with the next power of 2
N = 2^(nextpow2(N));
x1=x;
% Compute important lengths
M = length(h);
L = N-M+1;
Lx = length(x);

% Length-N DFT of filter

H = fft(h,N);

% Initialize y (include some extra zeros at end)
y = zeros(Lx+N,1);
r=rem(Lx,L);
% Pad x with zeros to be a multiple of L
x = [x; zeros(L-r,1)]; 
x
% How many blocks will we have?
K = length(x)/L;

% Loop over blocks
for i=1:K
    
    % Extract length-L block from x 
    block = [ x((i-1)*L+1 : (i)*L); zeros(M-1,1)];
    
    % Take length-N FFT of this block
    B = fft(block,N);
    
    % Compute product in frequency domain and take inverse DFT
    yblock = ifft(B.*H,N); 
    
    % If first block, initialize y
    if i==1
        y(1:N) = yblock;
    else  % Add the result to the appropriate location in y
        y((i-1)*L+1:(i-1)*L+N) = y((i-1)*L+1:(i-1)*L+N) + yblock;
    end
    
end

% Trim extra zeros from the end of y to get the correct length convolution
y = y(1:Lx+M-1);
subplot(2,1,1);
stem(y);
title("Code output");
subplot(2,1,2);
stem(conv(x1,h));
title("Conv Output");
sgtitle("Overlap Add");