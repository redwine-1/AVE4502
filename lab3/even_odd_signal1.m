%author: Muhtasim Redwan
%id: 22024002
%date: 01-11-2024
%description: even odd component of a signal

Fs=10;
duration=10;
t=-duration/2:1/Fs:duration/2;

signal =zeros(length(t),1);

signal(t >= 0 & t <= 2) = t(t>=0 & t<=2);
signal(t > 2 & t <= 4) = 4 - t (t>2 & t<=4);

signal_even = 0.5 * (signal + flip(signal));
signal_odd = 0.5 * (signal - flip(signal));

figure;

subplot(221)
plot(t, signal)
grid on;
xlabel("Time (s)");
ylabel("Amplitude ");
axis padded;
title("Main Signal");

subplot(222)
plot(t, signal_even)
grid on;
xlabel("Time (s)");
ylabel("Amplitude ");
axis padded;
title("Even Component of the Signal");

subplot(223);
plot(t, signal_odd)
grid on;
xlabel("Time (s)");
ylabel("Amplitude ");
axis padded;
title("Odd Component of the Signal");

subplot(224);
plot(t, signal_even+signal_odd)
grid on;
xlabel("Time (s)");
ylabel("Amplitude ");
axis padded;
title("Even + Odd Components of the Signal");



