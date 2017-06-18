% model an airfoil using full degree polynomials
clc;

% define domain
d = linspace(0,1);

% given data points
x = [0 0.005 0.0075 0.0125 0.025 0.05 0.1...
    0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];

yu = [0 0.0102 0.0134 0.017 0.025 0.0376 0.0563...
    0.0812 0.0962 0.1035 0.1033 0.095 0.0802 0.0597 0.034 0];

yl = [0 -0.0052 -0.0064 -0.0063 -0.0064 -0.006 -0.0045 -0.0016 0.001...
    0.0036 0.007 0.0121 0.017 0.0199 0.0178 0];

% generate upper and lower splines
upoly = polyfit(x,yu,16);
lpoly = polyfit(x,yl,16);

% draw interpolants
zu = polyval(upoly,d);
zl = polyval(lpoly,d);

plot(x,yu,'ro',x,yl,'o',d,zu,d,zl);
legend('Upper airfoil data', 'Lower airfoil data', 'Upper interpolant',...
    'Lower interpolant');

% redefine y-axis limits in order to see original airfoil
axis([0 1 -0.01 0.15]);