% myA.m
%
% Fill out an nxn matrix, where each entry a_{ij} is determined by the
%   formula a_{ij} = 5/(i+2j-1). Return the result b=Ax, where x is a size
%   n vector of ones.

function [A,b] = myA(n)
% input: 
% n = size of square matrix A
%
% output:
% A = resulting matrix A
% b = Ax

% initialize A as a zero matrix
A = zeros(n);

% loops to populate A
for i = 1:n
    for j = 1:n
        A(i,j) = 5/(i+2*j-1);
    end
end

% create x vector
x = ones(n,1);

% calculate b vector
b = A*x;