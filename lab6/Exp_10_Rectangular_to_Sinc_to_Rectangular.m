%Write a Matlab code to convert a rectangular pulse to sinc signal.
%Also investigate the impact of the width of the rectangular pulse
%on the sinc signal.

T = 2;              % Width of the rectangular pulse
fs = 1000;          % Sampling frequency
t = -2*T:1/fs:2*T;  % Time vector
N = length(t);      % Number of samples

% Rectangular pulse
x_rect = zeros(size(t));
x_rect(abs(t) <= T/2) = 1;

% Frequency vector
f = linspace(-fs/2, fs/2, N);

% Calculate Fourier transform of the rectangular pulse
X_rect = zeros(size(f));
for k = 1:length(f)
    X_rect(k) = sum(x_rect .* exp(-1i*2*pi*f(k)*t)) / fs;
end

% Calculate inverse Fourier transform to get sinc function
sinc_func = zeros(size(t));
for n = 1:length(t)
    sinc_func(n) = sum(X_rect .* exp(1i*2*pi*f*t(n)));
end

% Plotting the rectangular pulse (TD)
figure;
plot(t, x_rect, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Rectangular Pulse');
grid on;

% Plotting the sinc signal obtained via DFT
figure;
plot(f, abs(X_rect), 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude spectrum (Fourier Transform)');
grid on;

% Plotting the rectangular pulse obtained via Inverse DFT from sinc signal
figure; plot(t, abs(sinc_func)/max(abs(sinc_func)), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Rectangular Pulse (Inverse DFT)');
grid on;
