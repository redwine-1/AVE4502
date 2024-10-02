%name: Muhtasim Redwan
%date: 02/10/2024
%description: sinc function of three different values

duration = 10;
fs =  500;                          %sampling frequency
t = -duration/2:1/fs:duration/2;    %time duration 

omega = [1 2 10];                   %angular frequencies

figure;
hold on;                            %to plot data on same figure 

%looping through the omega array
for i=1:length(omega)
    sinc_func = sin(pi*omega(i)*t)./(pi.*t*omega(i));
    plot(t, sinc_func,'DisplayName', ['\omega = ' num2str(omega(i))]);
end


legend;
title("sinc function of three different values");
xlabel("Time (s)");
ylabel("Amplitude");
grid on;
hold off;