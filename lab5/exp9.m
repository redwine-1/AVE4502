%author: Muhtasim Redwan
%id: 22024002
%date: 20-11-2024
%description: frequency domain representation of a rectangular signal

duration = 5;
fs = 200;
t = -duration/2:1/fs:duration/2;
N = length(t);

% rectangular signal
tau = 2;
x_rect = abs(t) <= tau/2;

% plot rectangular signal
figure;
plot(t, x_rect);
xlabel("Time (s)");
ylabel("Amplitude");
grid on;
axis padded;

% fourier transform

f = linspace(-fs/2, fs/2, N);

X_allTime = zeros(size(t));
fourier_transform = zeros(size(f));

for k = 1:length(f)
    for n = 1:length(t)
        X_allTime(n) = x_rect(n) * exp(-1i*2*pi*f(k)*t(n));
    end
    fourier_transform(k) = sum(X_allTime)/fs;
end

plot(f,abs(fourier_transform));

