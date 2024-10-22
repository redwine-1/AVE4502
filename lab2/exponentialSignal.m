%author: Muhtasim Redwan
%id: 22024002
%date: 13-10-2024
%description: program to visualize real exponential signals

duration = 5;
fs = 100;
t = -duration/2:1/fs:duration/2;

A = [1 3 5];
d = [-1.2 1 1.2];


figure;
hold on;
for i=1:length(A)
    plot(t, A(i)*exp(1.*t), "LineWidth", 2, "DisplayName", ['$' num2str(A(i)) '\times e^t$']);
end
hold off;
grid on;
xlabel("Time (s)")
ylabel("Amplitude")
legend('Interpreter', 'latex');
title("x(t) for three different A ")

figure;
hold on;
for i=1:length(d)
    plot(t, exp(d(i).*t), "LineWidth", 2, "DisplayName", ['$ e^{' num2str(d(i)) 't}$']);
end
hold off;
grid on;
xlabel("Time (s)")
ylabel("Amplitude")
legend('Interpreter', 'latex');
title("x(t) for three different d")