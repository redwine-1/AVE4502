% Define the range of x
x = -2:0.01:2;  % from -2 to 2 with increments of 0.01

% Calculate the exponential function
y = exp(x);  % e^x

% Create the plot
figure;  % Create a new figure window
plot(x, y, 'b-', 'LineWidth', 2);  % Plot y vs x with blue line
xlabel('x');  % Label for x-axis
ylabel('y = e^x');  % Label for y-axis
title('Exponential Function: y = e^x');  % Title of the plot
grid on;  % Turn on the grid
axis tight;  % Adjust the axes to fit the data
