%name: Muhtasim Redwan
%date: 02/10/2024
%description: changing parameters of sinusoid

duration = 2;
fs = [2.5 10 500];                      %sampling frequency array
signal_frequency = [1 2 4];             %signal frequency array
phase = [0 30 60];                     %phase array

t = -duration/2:1/fs(end):duration/2;   %time array

%different frequencies
figure;
hold on;
for i=1:length(signal_frequency)
    f = sin(2*pi*signal_frequency(i)*t + phase(1));
    plot(t, f, "DisplayName", ['f = ' num2str(signal_frequency(i))]);
end
hold off;
legend;
title("sine waves of different frequencies");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;

%different phases
figure;
hold on;
for i=1:length(phase)
    f = sin(2*pi*signal_frequency(1)*t + phase(i));
    plot(t, f, "DisplayName", ['\theta = ' num2str(phase(i))]);
end
hold off;
legend;
title("sine waves of  different phase");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;

%different sampling frequency
figure;
hold on;
for i=1:length(fs)
    t_freq = -duration/2:1/fs(i):duration/2;
    f = sin(2*pi*signal_frequency(1)*t_freq + phase(1));
    plot(t_freq, f, "DisplayName", ['sampling freq = ' num2str(fs(i))]);
end
hold off;
legend;
title("sine waves of different sampling frequency");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;


%with DC offset
figure;
f = 3+sin(2*pi*signal_frequency(1)*t + phase(1));
plot(t,f);
title('$3 + A\sin(2\pi f t + \theta)$', 'Interpreter', 'latex');
xlabel("Time (s)");
ylabel("Amplitude");
grid on;

%Changing Amplitude
figure;
f = 3.*sin(2*pi*signal_frequency(1)*t + phase(1));
plot(t,f);
title('$3 \times A\sin(2\pi f t + \theta)$', 'Interpreter', 'latex');
xlabel("Time (s)");
ylabel("Amplitude");
grid on;