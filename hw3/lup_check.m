% generate LU decomposition of matrix A

A = [1 2 3 4; 2 3 7 9; -2 -6 -2 -4; 1 0 11 15];
[L,U,P] = lu(A);


%Display results
fprintf('L =\n');
disp(L);

fprintf('\nU =\n');
disp(U);

fprintf('\nP =\n');
disp(P);