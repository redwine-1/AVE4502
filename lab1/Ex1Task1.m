%author: Muhtasim Redwan
%id: 22024002
%date: 13-10-2024
%description: the continuous time unit impulse, unit step, ramp, and rectangular signals.

duration = 4;                       %signal duration
fs = 100;                           %sampling frequency
tau = 1;                            %tau for rectangular signal

t = -duration/2:1/fs:duration/2;    %time axis

unit_impulse_signal = t == 0;
unit_step_signal = t >= 0;
ramp_signal = t.*unit_step_signal;
rectangular_signal = abs(t) <= tau/2;

figure;
plot_signal(t, unit_impulse_signal, "Unit Impulse Signal", 1);
plot_signal(t, unit_step_signal, "Unit Step Signal", 2);
plot_signal(t, ramp_signal, "Ramp Signal", 3);
plot_signal(t, rectangular_signal, "Rectangular Signal", 4);


function plot_signal(t, signal, titleStr, subplotIndex)
subplot(4, 1, subplotIndex);
plot(t, signal, "LineWidth", 2);
xlabel("Time (s)");
ylabel("Amplitude");
title(titleStr);
grid on;
axis padded;
end

