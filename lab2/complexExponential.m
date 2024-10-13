%author: Muhtasim Redwan
%id: 22024002
%date: 13-10-2024
%description: program to visualize complex exponential signals

duration = 5;
fs = 100;
t = -duration/2:1/fs:duration/2;
freq = [4 0.5 1.5];

A = 3;
d = [-1.2 1 1.2];



figure;
hold on;
for i=1:3
    x1 = exp(d(i).*t) .* A.*sin(2*pi*5.5.*t);
    plot(t, x1, "DisplayName", ['d = ' num2str(d(i))], "LineWidth", 1.2);
end
title(['$' num2str(A) 'e^{dt} \sin{2 \pi 5.5 t}$'],'Interpreter','latex');
grid on;
hold off;
legend;


figure;
hold on;
for i=1:3
    x1 = exp(t) .* A.*sin(2*pi*freq(i).*t);
    plot(t, x1, "DisplayName", ['f = ' num2str(freq(i))], "LineWidth", 1.2);
end
title(['$' num2str(A) 'e^{t} \sin{2 \pi f t}$'],'Interpreter','latex');
grid on;
grid on;
hold off;
legend;



figure;
hold on;
for i=1:3
    x2 = exp(d(i).*t) + A.*sin(2*pi*6.*t);
    plot(t, x2, "DisplayName", ['d = ' num2str(d(i))], "LineWidth", 1.2);
end
title(['$' num2str(A) 'e^{dt} \sin{2 \pi 5.5 t}$'],'Interpreter','latex');
grid on;
hold off;
legend;


figure;
hold on;
for i=1:3
    x2 = exp(t) + A.*sin(2*pi*freq(i).*t);
    plot(t, x2, "DisplayName", ['f = ' num2str(freq(i))], "LineWidth", 1.2);
end
title(['$' num2str(A) 'e^{t} \sin{2 \pi f t}$'],'Interpreter','latex');
grid on;
grid on;
hold off;
legend;
