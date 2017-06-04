function r = Newton(fun,x0,tol)
%
% Input: fun = handle of function, defined in an m-file that
% returns f(x) and f'(x)
% x0 = initial guess
% tol = tolerance for stopping
%
% Output: r = the root of f
x = x0; % initial guess
k = 0; % initialize iteration counter
maxit=20; % max iterations allowed
while k<= maxit
    k=k+1;
    [f,fp] = fun(x);
    dx = f/fp;
    x = x-dx;
    err = abs(dx);  
    fprintf('\n k = %i Solution = %20.15e Error = %15.10e \n',k,x,err);
if (err < tol), r=x; return; end
end
warning(sprintf('root not found within tolerance after %d iterations\n',k));
%%%%%%%%%%%%%%%%%%%%%%%
