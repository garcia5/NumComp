function [x,n] = myNewton(fun, x0, tol)
% input:
% x0 = initial guess
% tol = tolerance allowed for error
%  - tol calculated by (x_n+1)-(x_n), as f'(x) is small close to f(x)=0
% fun = function whose zeroes are being calculated
%
% output:
% x = calculated root of f(x)
% n = number of iterations needed to calculate root

x = x0; % initial guess
n = 0;
% initialize other vars to zero
err = 0;
dx = 0;
while n <= 20 % set iteration limit to 20, just in case
    n = n+1;
    [y,yp] = fun(x); % assign functions defined in f.m
    dx = y/yp;
    xn = x-dx; % calculate next root
    err = abs(xn-x); % calculate deviation between each root
    fprintf('\n n = %i Solution = %12.7e    Error = %7.7e \n',n,x,err);
    x = xn;
    if err<=tol, return; end
end
warning(sprintf('root not found within tolerance after %d iterations\n',n));
        