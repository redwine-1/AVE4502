%name: Muhtasim Redwan
%date: 18/09/2024
%description: unit imuplse signal 

duration = 4;
fs = 100; % sampling frequency

t = -duration/2:1/fs:duration/2;

unit_impulse_signal = zeros(1,length(t));

for i=1:length(t)
    if t(i) == 0
        unit_impulse_signal(i) = 1;
    end
end

plot(t, unit_impulse_signal);
ylim([-.2 1.2]);
xlabel("Time (s)");
ylabel("Amplitude");
title("Unit step signal");
grid on;