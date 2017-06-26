function c = int_ratio(a,b,fun,s,tol)
% int_ratio.m
%   script to calculate a value c such that the area under a given curve
%       between x=a and x=c is s% of the area under the same curve from x=a to
%       x=b. 
%   input:
%       a,b = interval of integration
%       @f = function to be integrated
%       s = ratio of areas
%       tol = tolerance of the result
%   output:
%       c = upper limit of integration to achieve desired ratio
clc;

% calculate integral using built in routine
A = integral(fun,a,b);
fprintf('Area under f(x) for 0 <= x <= 1: \n\t%.6f\n\n',A);

% calculate initial step size for c using error estimate for composite
% simpson's rule
step = ((90/10^6)/24)^(1/5);

% begin with starting guess cc. this value is updated every time the
% desired ratio is exceeded
cc = 0;

fprintf('c      \t\tN      \t\tN/A\n');
disp('---------------------------------');

% iterate through c values with initial step size = step
% if no acceptable value is found, cut step size in half and repeat
% no more than 20 halvings of step is allowed

for iter = 1:20
    % iterate through possible c values, stopping when
    % |integral(@f,a,c)/integral(@f,a,b)| \in s=+-10^-6
    fprintf('Step size %.5f\n',step);
    accept = 0;
    for c = cc:step:b
        % evaluate integral
        N = integral(fun,a,c);
        
        %if mod((100000*c),2) == 0
            fprintf('%.6f\t',c);
            fprintf('%.6f\t',N);
            fprintf('%.6f\n',N/A);
        %end      
        
        % save values of c that get you close to the ratio
        if abs(N/A) < s
            cc = c;
        end

        % see if ratio is satisfied within tolerance
        if (s-tol < abs(N/A)) && (abs(N/A) < s+tol)
            fprintf('\nAcceptable value of c has been found.\n\tc = %.6f\n',c);
            % set flag to show that a good c value was found
            accept = 1;
            return;
        end
        
        % stop once you've definitely exceeded the ratio
        if abs(N/A) > s+tol
            break
        end
        
    end
    
    % acceptable c has been found
    if accept == 1
        return;
    end
    % no c has been found, try again with smaller steps
    if accept == 0
        step = step / 2;
    end
    fprintf('\n');
end 