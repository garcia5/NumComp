% fit data regarding bloodstream concentration

% time (hr)
x = (1:1:10)';

% data points
y = [6.2 9.5 12.3 13.9 14.6 13.5 13.3 12.7 12.4 11.9]';

% use 'fit' routine to fit data to model
ff = fit(x,y,'a*x*exp(b*x)');

% save coefficients
c = coeffvalues(ff);

% explicitly define the function anonymously, since
% cfit objects aren't as nice to work with
f =@(x) c(1)*x*exp(c(2)*x);

% generate vector of values
xx = linspace(1,10);
fv = feval(ff,xx);

% find maximum concentration
maxy = max(fv);
fprintf('Maximum fit concentration level: %.5f\n', maxy);

% calculate zeros of f-4. t values in between these zeros are the
% times during which the drug is within therapeutic range
fz = @(x) c(1)*x*exp(c(2)*x)-4;
z1 = fzero(fz, 10);
z2 = fzero(fz,50);

fprintf('The concentration will be outside the therapeutic range from ');
fprintf('t = %.5f to t=%.5f\n',z1,z2);

% calculate 50% concentration line
xh = linspace(0,25);
hy = maxy/2+0.*xh;

hold off
% plot fitting function, color according to therapeutic range
fplot(f,[z1 z2],'g');
hold all

% plot initial data
plot(x,y,'*');

% plot 50% concentration line
plot(xh,hy);

% plot f(x) that is outside therapeutic range
fplot(f,[z2 25],'r');
fplot(f,[0 z1],'r');

% add information
ylim([0 20]);
xlim([0 25]);
xlabel('t (hr)');   ylabel('y (ng/ml)');
legend('f(x)','data','50% max concentration','f(x) outside therapeutic range');