% Script to check part (c) of Holmes5.1

% define coefficient matrix A
A = [ 0 0 0 1 0 0 0 0;
    1 1 1 1 0 0 0 0;
    0 0 0 0 1 1 1 1;
    0 0 0 0 8 4 2 1;
    6 2 0 0 -6 -2 0 0;
    3 2 1 0 -3 -2 -1 0;
    0 2 0 0 0 0 0 0;
    0 0 0 0 12 4 0 0; ];

% define resultant vector b
b = [0 1 1 3 0 0 0 0]';

% calculate vector of coefficients
c = A\b;

% define domains
x1 = linspace(0,1);
x2 = linspace(1,2);

% define splines from c
S1 = c(1)*x1.^3 + c(2)*x1.^2 + c(3)*x1 + c(4);
S2 = c(5)*x2.^3 + c(6)*x2.^2 + c(7)*x2 + c(8);

% display results, including original data points
plot(x1,S1,x2,S2,0,0,'*',1,1,'*',2,3,'*');
legend('S1','S2','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');