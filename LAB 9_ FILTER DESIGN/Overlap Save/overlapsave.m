function y = overlapsave(h,x,N)

% If N is not already a power of 2, replace it with the next power of 2
N = 2^(nextpow2(N));
x1=x;

% Compute important lengths
M = length(h);
L = N-M+1;
Lx = length(x);

% Append M-1 0's to x

x = [ zeros(M-1,1); x];

% Length-N DFT of filter

H = fft(h,N);

% Initialize y
y = [];

% Until we have no more blocks
while ~isempty(x);
    
    % Extract length-N block from the front of x (or all of x if length is less than N)
    if length(x)>N
        block = x(1:N);
    else
        block = x;
    end
    %disp(block);
    % Take length-N FFT of this block
    B = fft(block,N);
    
    % Compute product in frequency domain and take inverse DFT
    yblock = ifft(H.*B);
    
    % Append the non-aliased part of y to the result
    y = [y; yblock(M:end)];
    % Remove L data points from the front of x
    x = x(L+1:end,1);
end

% Trim extra zeros from the end of y to get the correct length convolution
y = y(1:Lx+M-1);
subplot(2,1,1);
stem(y);
title("Plot y");
subplot(2,1,2);
stem(conv(x1,h));
title("Plot conv");
sgtitle("Overlap Save");