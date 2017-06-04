% Plot the function 1/x

% define function and domain
x = linspace(-10,10);
y = 1./x;

% plot y from [-10,10]
plot(x,y);

% add information
title('Graph of 1/x');
xlabel('-10 \leq x \leq 10');
ylabel('1/x');