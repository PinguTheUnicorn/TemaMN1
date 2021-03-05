function [G_J, c_J] = Jacobi_factorization(A, b)
  P = -(tril(A, -1) + triu(A, 1));
  N = A + P;
  G_J = inv(N) * P;
  c_J = inv(N) * b;
endfunction
