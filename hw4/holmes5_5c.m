% Script to check part (c) of Holmes5.5
clc;

% function definition
f = sin(x);

% define coefficient matrix A
A = [ 0 0 0 1 0 0 0 0;
    pi^3/64 pi^2/16 pi/4 1 0 0 0 0;
    0 0 0 0 pi^3/64 pi^2/16 pi/4 1;
    0 0 0 0 pi^3/8 pi^2/4 pi/2 1;
    3*pi^2/16 pi/2 1 0 -3*pi^2/16 -pi/2 -1 0;
    3*pi/2 2 0 0 -3*pi/2 -2 0 0;
    0 2 0 0 0 0 0 0;
    0 0 0 0 3*pi 2 0 0; ];

% define resultant vector b
b = [0 sqrt(2)/2 sqrt(2)/2 1 0 0 0 0]';

% calculate vector of coefficients
c = A\b;

fprintf('S1 = %.5fx^3 + %.5fx^2 + %.5fx + %.5f\n',c(1),c(2),c(3),c(4));
fprintf('S2 = %.5fx^3 + %.5fx^2 + %.5fx + %.5f\n',c(5),c(6),c(7),c(8));

% define domains
x = linspace(0,pi/2);
x1 = linspace(0,pi/4);
x2 = linspace(pi/4,pi/2);

% define splines from c
S1 = c(1)*x1.^3 + c(2)*x1.^2 + c(3)*x1 + c(4);
S2 = c(5)*x2.^3 + c(6)*x2.^2 + c(7)*x2 + c(8);

% display results, including original data points
plot(x,f,x1,S1,x2,S2,0,0,'*',pi/4,sqrt(2)/2,'*',pi/2,1,'*');
legend('f','S1','S2','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');

% calculate error in interpolant at x = \pi/8
est = c(1)*(pi/8)^3 + c(2)*(pi/8)^2 + c(3)*(pi/8) + c(4);

err = est - sin(pi/8);
ea = abs(err);
fprintf('Estimated value of f(pi/8): %.5f\n', est);
fprintf('Absolute error in evaluating S_1(pi/8): %.5f\n', ea);