% Plot the functions sinx, 1-x^2

% define function and domain
x = linspace(0,3);
y1 = sin(x);
y2 = 1-x.^2;

% plot y from [-10,10]
plot(x,y1, x,y2);

% add information
xlabel('0\leq x \leq 3');
legend('y1 = sin(x)','y2 = 1-x^{2}','Location','northeast');