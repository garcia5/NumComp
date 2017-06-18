% script to generate a picture from given data points
clc;
close all;

% generate data points - this was done using GeoGebra in order to get a
% nicer picture
x = [0.83; 0.76; 0.67; 0.51; 0.41; 0.33; 0.27; 0.27; 0.35; 0.47; 0.59; 0.71;
    0.83; 0.91; 0.93; 0.92; 0.89; 0.84; 0.82; 0.83; 0.86; 0.89; 0.93; 0.97; ];

y = [0.75; 0.78; 0.81; 0.81; 0.74; 0.63; 0.47; 0.30; 0.21; 0.17; 0.15; 0.17;
    0.24; 0.35; 0.50; 0.67; 0.74; 0.66; 0.50; 0.41; 0.32; 0.25; 0.18; 0.12; ];

% keep track of the total number of data points
n = length(x);

% display data results
fprintf('Initial data\n');
fprintf('     i     x_i         y_i\n');

for ii = 1:n
    fprintf('     %d     %.5f     %.5f\n',ii,x(ii),y(ii));
end

% define constant spacing
i = (1:1:n);

% compute splines for x and y values
sx = spline(i,x);
sy = spline(i,y);

% generate vectors for domain, x data, y data
d = linspace(1,n);
zx = ppval(sx,d);
zy = ppval(sy,d);

% plot x spline and data points
plot(i,x,'*',d,zx);
xlabel('i');
ylabel('x');

% plot y spline and data points
figure;
plot(i,y,'*',d,zy);
xlabel('i');
ylabel('y');

% plot full spline and data points
figure;
plot(zx,zy,x,y,'*');