% check lagrange interpolation of f(x) = sinx
clc;
% function definition
f = sin(x);

% calculated interpolant definition
s1 = ((8-8*sqrt(2))*x.^2+(4*sqrt(2)*pi-2*pi)*x)/pi^2;

% display original plot, interpolant, and data points
x = linspace(0,pi/2);
plot(x,f,x,s1,0,0,'*',pi/4,sqrt(2)/2,'*',pi/2,1,'*');
legend('f(x)','y','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');

% calculate error in interpolant at x = \pi/8
est = ((8-8*sqrt(2))*(pi/8)^2+(4*sqrt(2)*pi-2*pi)*(pi/8))/pi^2;

err = est - sin(pi/8);
ea = abs(err);
fprintf('Estimated value of f(pi/8): %.5f\n', est);
fprintf('Absolute error in evaluating y(pi/8): %.5f\n', ea);
