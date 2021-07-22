function [x] = SST(A, b)
  n = size(A,2);
  x = zeros(n,1);
  x(n) = b(n)/A(n,n);
  i = n-1;
  while i >= 1
    sum = 0;
    for j = i+1 : n
      sum = sum + A(i,j)*x(j);
    endfor
    x(i) = (b(i)-sum)/A(i,i);
    i = i-1;
  endwhile
endfunction
    