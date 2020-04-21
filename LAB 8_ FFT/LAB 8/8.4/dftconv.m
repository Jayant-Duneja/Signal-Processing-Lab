function [conv_circ, conv_lin] = dftconv(h,x,N);
    lx = length(x);
    lh = length(h);
    if N<max([lx lh])
     error('N must be at least the length of the longer signal.')
    end


    % Compute order-N circular convolution based on length-N FFTs
    x1=[x; zeros(N-lx,1)];
    h1=[h; zeros(N-lh,1)];
    conv_circ = ifft(fft(x1) .* fft(h1));

    % Compute linear convolution based on appropriate-length FFTs/zero padding

    x2=[x; zeros(lh-1,1)];
    h2=[h; zeros(lx-1,1)];
    conv_lin = ifft(fft(x2) .* fft(h2));

    subplot(2,2,1)
    stem(conv_circ);
    title("conv_circ");

    subplot(2,2,2)
    stem(cconv(h,x,N));
    title("cconv");

    subplot(2,2,3)
    stem(conv_lin);
    title("conv_lin");

    subplot(2,2,4)
    stem(conv(h,x));
    title("conv");
end

%8.4a: the computational complexity of evaluating the convolution as shown above is O(NlogN) since the fft algorithm is called 4 times, and its complexity is NlogN.

%8.4b: the complexity of a normal time domain convolution is O(N^2) since two N length signals are multiplied together to get the one output x(i) for some i. For one output, complexity is N. For calculating all the N outputs, complexity is N^2.


