%author: Muhtasim Redwan
%id: 22024002
%date: 20-11-2024
%description: check the time-invariance property

%definitions
duration = 10;
fs = 100;
t = -duration/2:1/fs:+duration/2;

%unit step function
u_t = @(t) t >= 0;

% delays
T = {2, -3};

% define signal
x = @(shift) u_t(t+shift) - u_t(t-1+shift);

% define systems
system1 = @(x) 2*x;
system2 = @(x) x.^2;
system3 = @(x,t) t.*exp(x);

systems = {system1, system2, system3};
system_names = {'System1', 'System2', 'System3'};


% task 1 - 3
%------------------------------------

figure;
for i = 1:length(systems)
    subplot(3, 1, i);
    hold on;
    
    step1 = x(0);
    plot(t, step1, "DisplayName", "x(t)", "LineWidth", 1.5, "LineStyle", "-");
    
    if i ~= 3
        step2 = systems{i}(step1);
    else
        step2 = systems{i}(step1, t);
    end
    plot(t, step2, "DisplayName", "y(t)", "LineWidth", 1.2, "LineStyle", "--");
    
    
    for j = 1:length(T)
        samples_to_shift = T{j} * fs;
        step3 = circshift(step2, samples_to_shift);
        plot(t, step3, ...
            "DisplayName", sprintf("y(t%+d)", -T{j}), ...
            "LineWidth", 1, "LineStyle", "-.");
        
        step5 = x(-T{j});
        if i ~= 3
            step6 = systems{i}(step5);
        else
            step6 = systems{i}(step5, t);
        end
        if isequal(step3, step6)
            disp([system_names{i} ' is time-invariant']);
        else
            disp([system_names{i} ' is not time-invariant']);
        end
        
        step4 = step1;
        plot(t, step4, ...
            "DisplayName", sprintf("x(t%+d)", -T{j}), ...
            "LineWidth", 1, "LineStyle", ":");
        plot(t, step6, ...
            "DisplayName", sprintf("y(x(t%+d))", -T{j}), ...
            "LineWidth", 1, "LineStyle", "--");
    end
    
    % Customize plot
    xlabel("Time(s)");
    ylabel("Magnitude");
    title(sprintf("System %d Response", i));
    legend("show", "Interpreter", "latex", "Location", "best");
    grid on;
    hold off;
    axis padded;
end

fprintf("\n\n");

% task 4
%--------
% define signals

x1 = u_t(t) - u_t(t-1);
x2 = sin(10*t).*(u_t(t+1)-u_t(t-2));
x3 = cos(20*t);

signals = {x1, x2, x3};

for k = 1:length(signals)
    for i = 1:length(systems)
        subplot(3, 1, i);
        hold on;
        
        step1 = signals{k};
        if i ~= 3
            step2 = systems{i}(step1);
        else
            step2 = systems{i}(step1, t);
        end
        
        for j = 1:length(T)
            samples_to_shift = T{j} * fs;
            step3 = circshift(step2, samples_to_shift);
            
            step5 = circshift(step1, samples_to_shift);
            if i ~= 3
                step6 = systems{i}(step5);
            else
                step6 = systems{i}(step5, t);
            end
            if isequal(step3, step6)
                disp([system_names{i} ' is time-invariant for signal '  num2str(k) ]);
            else
                disp([system_names{i} ' is not time-invariant for signal '  num2str(k)]);
            end
        end
        
    end
end
