% ode_sys.m
%   solve a system of 2 ODE's using the RK2 algorithm
clc;
close all;

% define constants
a = 10;     % used for f1
b = 4;      % used for f2
h = 0.01;   % step size
t0 = 0;     % interval start
tn = 30;    % interval end

% define given equations
f =@(y) [ a - y(1) - (4*y(1).*y(2))./(1+y(1).^2);
    b*y(1)*(1-(y(2)./(1+y(1).^2))) ];

% define given initial conditions
alpha = [0; 2];

% preallocate w
w = [zeros(1,(tn-t0)/h);
    zeros(1, (tn-t0)/h)];

% caluculate data for y1, y2 using Hune's method
% define constants used in RK method
i = 1;
% don't start iteration at t=t0, as this is taken care of by I.C.s
for t = (t0+h):h:tn
    
    % set w(0) on the first iteration
    if i == 1
        w(1:2,1) = alpha;
    end
    
    disp(w(1:2,i));
    
    % calculate constants k1, k2
    k1 = f(w(1:2,i));
    k2 = f(w(1:2,i)+h.*k1);
    
    % use k1, k2 to calculate wi+1
    w(1:2,i+1) = w(1:2,i) + (1/2)*h.*(k1 + k2);

    i = i + 1;
end

t = t0:h:tn;
% display results
plot(t,w(1,1:end));
title('Plot of y1 vs time');
xlabel('t');    ylabel('y1');

figure
plot(w(1,1:end),w(2,1:end));
title('Plot of y2 vs y1');
xlabel('y1');   ylabel('y2');
