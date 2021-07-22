function [G_J, c_J] = Jacobi_factorization(A, b)
  ## finding the iteration matrix and array
  N = diag (diag (A));
  P = N - A;
  N_inverse = inv (N);
  G_J = N_inverse * P;
  c_J = N_inverse * b;
endfunction
