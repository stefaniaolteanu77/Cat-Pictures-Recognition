function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  ## the initial array that the solution is aproximated with
  xi = zeros (length(c), 1);
  while 1
    y = csr_multiplication (G_values, G_colind, G_rowptr, xi);
    x = y + c;
    error = norm (x - xi);
    ## when the error is smaller than the tolerance we stop
    if error < tol
      return;
    endif
    xi = x;  
  endwhile
endfunction