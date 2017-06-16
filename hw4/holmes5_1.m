% check for Holmes 5.1

% define calculated interpolant
y = (1/2)*(x.^2 + x);
x = linspace(0,3);

% display results, including original data points
plot(x,y,0,0,'*',1,1,'*',2,3,'*');
legend('Interpolant','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');