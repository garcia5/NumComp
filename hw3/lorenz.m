% solve the Lorenz system of equations using Newton's method
function [x1,x2,x3] = lorenz(x0,y0,z0)

% define given initial conditions
s = 10;
r = 28;
b = 8/3;

% define the three functions in the system
f1 =@(x,y,z) s*(y-x);
f2 =@(x,y,z) r*x-y-x*z;
f3 =@(x,y,z) x*y-b*z;

% define functions' partials at points (x0,y0,z0)
f1x = -s;   f2x = r-z0;  f3x = y0;
f1y = s;    f2y = -1;   f3y = x0;
f1z = 0;    f2z = -x0;   f3z = -b;

% define solution vector
b = [f1(x0,y0,z0); f2(x0,y0,z0); f3(x0,y0,z0)];

% define jacobian
A = [f1x f1y f1z; f2x f2y f2z; f3x f3y f3z];

% solution vector
r = A\b;

% assign values of r to x1,x2,x3
x1 = r(1);
x2 = r(2);
x3 = r(3);