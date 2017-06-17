% script to calculate full degree interpolant based on 
% ideal node spacing
clc;

% define domain
xx = linspace(0,pi/2);

% define original function
f = sin(xx);

% calculate ideal nodes
x1 = (pi/4)-(pi/4)*cos(pi/6);
x2 = (pi/4)-(pi/4)*cos(pi/2);
x3 = (pi/4)-(pi/4)*cos(5*pi/6);

% calculate lagrange basis polynomial based on ideal nodes
L1 = (xx-x2)./(x1-x2) .* (xx-x3)./(x1-x3);
L2 = (xx-x1)./(x2-x1) .* (xx-x3)./(x2-x3);
L3 = (xx-x1)./(x3-x1) .* (xx-x2)./(x3-x2);

y = sin(x1).*L1 + sin(x2).*L2 + sin(x3).*L3;

% display interpolant, original function, and data points
plot(xx,y,xx,f,x1,sin(x1),'*',x2,sin(x2),'*',x3,sin(x3),'*');
legend('y','f','(x_1,y_1)','(x_2,y_2)','(x_3,y_3)','Location','Northwest');

% calculate error in interpolant at y(\pi/8)
xx = pi/8;

L1 = (xx-x2)./(x1-x2) .* (xx-x3)./(x1-x3);
L2 = (xx-x1)./(x2-x1) .* (xx-x3)./(x2-x3);
L3 = (xx-x1)./(x3-x1) .* (xx-x2)./(x3-x2);

est = sin(x1).*L1 + sin(x2).*L2 + sin(x3).*L3;

err = est-sin(pi/8);
ea = abs(err);

fprintf('Estimated value of f(pi/8): %.5f\n',est);
fprintf('Absolute error in evaluating y(pi/8): %.5f\n',ea);