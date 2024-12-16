%Write a Matlab code to calculate the response of a system exploiting
%the properties of Fourier transform.
%where x(t)=u[n]-u[n-5] and h[n]=(3/4)^n.

N=32; %No. of FFT points
n=0:N-1;
% x=heaviside(n)-heaviside(n-5); %input signal
x=ones(1,N)-[zeros(1,5) ones(1,N-5)];
% x=[x zeros(1,N-length(x))];  
h=(3/4).^n;  %Impulse response

X=fft(x);  %DFT of input
H=fft(h);  %DFT of impulse (frequency response)
Y=H.*X;    %DFT of system output
y=real(ifft(Y));  %System output in time domain

figure;
subplot(3,1,1);
stem(n,x,'r');
ylabel('Input');xlabel('n');
subplot(3,1,2);
stem(n,h,'b');
ylabel('Impulse response');xlabel('n');
subplot(3,1,3);
stem(n,y,'k');
ylabel('System response');xlabel('n');