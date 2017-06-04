% Plot the function sinx + x^2 - 1

% define function and domain
x = linspace(0,1);
yp = cos(x) + 2*x;
ypp = 2 - sin(x);

% plot y from [-10,10]
plot(x,yp, x,ypp);

% add information
xlabel('0\leq x \leq 1');
legend('f^{(1)}(x)', 'f^{(2)}(x)','Location','northeast');
grid on