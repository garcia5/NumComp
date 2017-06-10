% Script to run myA.m over values of n = 5:20, or unil the error grows
%   large enough that there is no significance in the results
clc;

%supress warnings
warning('off','all');

for n = 5:20
    % get calculated values of the solution vector x
    [A,b] = myA(n);
    xc = A\b;
    
    % define correct solution, x
    x = ones(n,1);
    
    % calculate residual
    r = b - A*xc;
    % then the infinity norm of the residual
    nr = norm(r,Inf);
    
    % calculate error
    E = xc - x;
    % then the infinity norm of the error
    nE = norm(E,Inf);
    
    % estimate condition number of A
    % (this should grow with increasing n)
    kA = cond(A,Inf);
    
    % calculate relative error
    rE = nE / norm(xc,Inf);
    
    % calculate relative residual
    rr = nr / (norm(A,Inf)*norm(xc,Inf));
    
    % calues values for error bound inequality
    scaledR = kA * rr;
    
    % display results
    fprintf('\nn = %d\n',n);
    fprintf('computed solution\n');
    disp(xc);
    fprintf('residual norm  error norm     K(A)           relative residual  upper error bound\n');
    fprintf('%10.5e    %10.5e    %10.5e    %10.5e        %10.5e     %10.5e\n',nr,nE,kA,rr,scaledR);
    fprintf('\nrelative error\n');
    fprintf('%10.5e\n',rE);
    
    % stop the loop if re > 1
    if rE >= 1
        fprintf('Error has exceeded 100%%.\n');
        return;
    end
    
end