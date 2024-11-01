% Author: Muhtasim Redwan
% ID: 22024002
% Date: 01-11-2024
% Description: Even and odd components of a signal

Fs = 10;
duration = 10;
t = -duration/2 : 1/Fs : duration/2;

signal = zeros(length(t),1);

% Define the signal for t >= 0
signal(t >= 0) = 4 * exp(-t(t >= 0));

% Calculate the even and odd components of the signal
signal_even = 0.5 * (signal + flip(signal));
signal_odd = 0.5 * (signal - flip(signal));

figure;

subplot(2,2,1);
stem(t, signal);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
axis padded;
title("Main Signal");

subplot(2,2,2);
stem(t, signal_even);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
axis padded;
title("Even Component of the Signal");

subplot(2,2,3);
stem(t, signal_odd);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
axis padded;
title("Odd Component of the Signal");

subplot(2,2,4);
stem(t, signal_even + signal_odd);
grid on;
xlabel("Time (s)");
ylabel("Amplitude");
axis padded;
title("Even + Odd Components of the Signal");
