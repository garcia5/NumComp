% compute the inverse of 5x5 matrix A using the iterative method
% Aui = vi, where ui is the ith column vector of the inverse, and
% vi is a vector with a 1 in the ith place, and zeros in the rest
clc;

% create random matrix A
A = rand(5);
fprintf('Initial matrix A =\n');
disp(A);

% initialize A^{-1}
Ain = zeros(5,1);

% iterate through all columns
for i = 1:5
    % create resultant vector
    v = zeros(5,1);
    v(i) = 1;
    
    % calculate each column of A^{-1} (ui)
    ui = A\v;
    %disp(ui);
    
    % add column to inverse matrix
    Ain = cat(2,Ain,ui);
    
end

% strip initial zero values of Ain
Ain = Ain(:,2:end);

fprintf('Calculated A^{-1} =\n');
disp(Ain);

% check that A*A^{-1} = I
ic = A*Ain;

fprintf('Calculated I =\n');
disp(ic);