%name: Muhtasim Redwan
%date: 18/09/2024
%description: ramp signal 

duration = 4;
fs = 100; % sampling frequency

t = -duration/2:1/fs:duration/2;

ramp = zeros(1,length(t));

for i=1:length(t)
    if t(i) >= 0
        ramp(i) = t(i);
    end
end

plot(t, ramp);
ylim([-.1 1.2]);
xlabel("Time (s)");
ylabel("Amplitude");
title("Ramp signal");
grid on;