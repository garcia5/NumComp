% run successive loops of the Lorenz system to find solutions
clc;

% define constants
s = 10; r = 28; b = 8/3;

% define functions
f1 =@(x,y,z) s*(y-x);
f2 =@(x,y,z) r*x - y - x*z;
f3 =@(x,y,z) x*y - b*z;

% initial guesses
x0 = 5;
y0 = 5;
z0 = 5;

% iteration counter
it = 0;

% tolerance in the results
tol = 1e-10;

fprintf('Computing zeros within tolerance of %e\n',tol);
fprintf('Initial guesses: x = %d   y = %d   z = %d\n',x0,y0,z0);

% begin the algorithm
while it <= 20
    it = it + 1;
    
    % calculate new guesses
    [x,y,z] = lorenz(x0,y0,z0);
    x1 = x0 - x;
    y1 = y0 - y;
    z1 = z0 - z;
    
    fprintf('\nn = %d\nNew guesses:\n', it);
    fprintf('x = %10.5e   y = %10.5e   z = %10.5e\n',x1,y1,z1);
    
    % check if two successive iterates are close
    if abs(x0-x1) <= tol && abs(y0-y1) <= tol && abs(z0-z1) <= tol
        % assign values and end
        x0 = x1;    y0 = y1;    z0 = z1;
        fprintf('\nTwo successive iterates are within %d in magnitude. Zero has been found\n',tol);
        break
    end
    
    % check if the functions are close enough to zero
    if abs(f1(x1,y1,z1)) <= (0+tol) &&...
        abs(f2(x1,y1,z1)) <= (0+tol) &&...
        abs(f3(x1,y1,z1)) <= (0+tol)
    
        % assign values and end
        x0 = x1;    y0 = y1;    z0 = z1;
        fprintf('\nValues of f1, f2, f3 are sufficiently close to zero. Zero has been found\n');
        break
    end
    
    % assign new values to guesses
    x0 = x1;    y0 = y1;    z0 = z1;
end

fprintf('\nSolutions:\nx = %10.5e   y = %10.5e   z = %10.5e\n',x0,y0,z0);