% check linear interpolation of f(x) = sinx
clc;
% function definition
f = sin(x);

% calculated interpolant definition
s1 = ((sqrt(2)/2)/(pi/4))*x;

% display original plot, interpolant, and data points
x = linspace(0,pi/4);
plot(x,f,x,s1,0,0,'*',pi/4,sqrt(2)/2,'*');
legend('f(x)','S_1(x)','(x_1,y_1)','(x_2,y_2)','Location','Northwest');

% calculate error in interpolant at x = \pi/8
est = ((sqrt(2)/2)/(pi/4))*(pi/8);

err = est - sin(pi/8);
ea = abs(err);
fprintf('Estimated value of f(pi/8): %.5f\n', est);
fprintf('Absolute error in evaluating S_1(pi/8): %.5f\n', ea);