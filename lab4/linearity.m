%author: Muhtasim Redwan
%id: 22024002
%date: 07-11-2024
%description: check linearity property

%definitions
duration = 4.5;
fs = 100;
t = -duration/2:1/fs:+duration/2;

%signal weights
k1 = 2;
k2 = 3;

%unit step functions
u_t = t >= 0;
u_t_plus_1 = t >= -1;
u_t_minus_1 = t >= 1;
u_t_minus_2 = t >= 2;

% define signals
x1 = u_t - u_t_minus_1;
x2 = sin(10*t).*(u_t_plus_1-u_t_minus_2);

% define systems
system1 = @(x) 2*x;
system2 = @(x) x.^2;
system3 = @(x) x.*exp(x);

% 1. visualize the input signals
%-------------------------------
figure;

%  plot signal 1
subplot(211)
plot(t, x1);
title("$ x_1(t) = u(t) - u(t-1)$","Interpreter","latex");
xlabel("Time (s)");
ylabel("Amplitude");
axis padded;

% plot signal 2
subplot(212)
plot(t, x2);
axis padded;
title("$ x_2(t) = sin(10t) \times [u(t+1) - u(t-2)]$","Interpreter","latex");
xlabel("Time (s)");
ylabel("Amplitude");

% 2. visualize k_1 * x_1 + k_2 * x_2
%-----------------------------------
figure;
sum_ks = k1*x1 + k2*x2;
plot(t, sum_ks);
axis padded;
title("$k_1 \times x_1(t) + k_2 \times x_2(t)$","Interpreter","latex");
xlabel("Time (s)");
ylabel("Amplitude");

% 3. visualize the system output for sum_ks
%------------------------------------------
sum_ks_response1 = system1(sum_ks);
sum_ks_response2 = system2(sum_ks);
sum_ks_response3 = system3(sum_ks);

figure;

subplot(311);
hold on;
plot(t, sum_ks_response1);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 2 response");
grid on;
axis padded;

subplot(312);
hold on;
plot(t, sum_ks_response2);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 1 response");
grid on;
axis padded;

subplot(313);
hold on;
plot(t, sum_ks_response3);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 3 response");
grid on;
axis padded;

% 4. input x1 and x2 individually
%--------------------------------

x1_response1 = system1(x1);
x1_response2 = system2(x1);
x1_response3 = system3(x1);

x2_response1 = system1(x2);
x2_response2 = system2(x2);
x2_response3 = system3(x2);

% 5. Multiply each output by the corresponding scaling factor and add the scaled output
%--------------------------------------------------------------------------------------

response1 = k1 * x1_response1 + k2 * x2_response1;
response2 = k1 * x1_response2 + k2 * x2_response2;
response3 = k1 * x1_response3 + k2 * x2_response3;

figure;

subplot(311);
hold on;
plot(t, response1);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 2 response");
grid on;
axis padded;

subplot(312);
hold on;
plot(t, response2);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 1 response");
grid on;
axis padded;

subplot(313);
hold on;
plot(t, response3);
xlabel("Time (s)");
ylabel("Amplitude");
title("System 3 response");
grid on;
axis padded;

% 6. print whether the system is linear or not.
% ---------------------------------------------
responses = {response1, response2, response3};
sum_ks_responses = {sum_ks_response1, sum_ks_response2, sum_ks_response3};
system_names = {'System1', 'System2', 'System3'};

for i = 1:3
    if isequal(responses{i}, sum_ks_responses{i})
        disp([system_names{i} ' is linear']);
    else
        disp([system_names{i} ' is not linear']);
    end
end