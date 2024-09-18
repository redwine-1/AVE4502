%name: Muhtasim Redwan
%date: 18/09/2024
%description: rectangular signal

duration = 4;
fs = 100; % sampling frequency
T = 1.5;

t = -duration/2:1/fs:duration/2;

rectangular = zeros(1,length(t));

for i=1:length(t)
    if abs(t(i)) <= T/2
        rectangular(i) = 1;
    end
end

plot(t, rectangular);
ylim([-.2 1.2]);
xlabel("Time (s)");
ylabel("Amplitude");
title("Rectangular signal");
grid on;

