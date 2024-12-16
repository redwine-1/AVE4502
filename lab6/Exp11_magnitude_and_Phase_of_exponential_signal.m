%Write a Matlab code to plot the magnitude and phase spectrum of
%x(t)=e^-(3t).
clear all;
t=0:0.1:40;  %time
x=exp(-3*t); %amplitude

figure(2);
subplot(3,1,1)
plot(t,x);
title("plot of exponential signal");
xlabel("time");
ylabel("amplitude");
axis([0 2 0 1]);
grid;

omega=-20:20;  %frequency (rad/sec)
N=length(omega); %Number of frequencies
mag=zeros(1,N); 
phase=zeros(1,N);
for i=1:N
    %Calculation of magnitude for |X(jw)|=1/(9+omega^2)
    mag(i)=abs(1/sqrt((9+omega(i)^2)));
    %Calculation of angle for |X(jw)|=1/(9+omega^2)
    %phase(i)=angle(1/(3+sqrt(-1)*omega(i))); %Also valid
    phase(i)=-atan(omega(i)/3);
end

%Plotting magnitude
subplot(3,1,2);
plot(omega,mag);
title("Magnitude spectrum");
xlabel("\omega");
ylabel("|X(\omega)|");
grid;

%Plotting phase
subplot(3,1,3);
plot(omega,phase);
title("Phase spectrum");
xlabel("\omega");
ylabel("Phase");
grid;