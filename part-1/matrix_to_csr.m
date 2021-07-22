function [values, colind, rowptr] = matrix_to_csr(A)
  values = nonzeros(A'); #values contains all the nonzero elements of the matrix
  values = values';
  nz = length(values);
  [i,j] = find(A);
  colind = i'; #colind contains the column index of the elements from values 
  rowptr(1) = 1;
  ## iterating through the colind array to find the elements of rowptr
  for k = 2 : nz-1
    if colind(k) < colind (k-1) && colind(k) <= colind(k+1)
      rowptr(end+1)=k;
    endif
  endfor
  ## adding at the end of rowptr number of nonzero values plus one
  rowptr(end+1) = nz+1;
endfunction