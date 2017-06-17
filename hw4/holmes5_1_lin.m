% script to check part (b) of Holmes 5.1

% define domain
x1 = linspace(0,1);
x2 = linspace(1,2);

% define functions
S1 = x1;
S2 = 2*x2 - 1;

% display results, including original data points
plot(x1,S1,x2,S2,0,0,'*',1,1,'*',2,3,'*');
legend('S1','S2','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');