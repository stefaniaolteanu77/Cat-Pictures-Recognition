function [w] = learn(X, y, lr, epochs)
  [rows,cols] = size (X);
  ## scaling every column in X
  X = (X(:,1:cols) - mean(X(:,1:cols))) ./ std(X(:,1:cols));
  X(:,end+1) = 1;
  X_tilda = X;
  ## random value for w
  xmin = -0.1;
  xmax = 0.1;
  n = cols + 1;
  w = xmin + rand (1, n) * (xmax - xmin);
  w = w';
 for epoch = 1:epochs
 ## random rows from X_tilda
 idx = randperm (size (X_tilda, 1), 64);
 X_batch =  X_tilda(idx,:);
 ## the labels for the random rows 
 y_batch = y(idx);
 for i = 1 : cols+1
  s = sum( (X_batch(1:64,:) * w - y_batch(1:64)) .* X_batch(1:64,i) );
  w(i) =  w(i) - (lr/rows)*s;
 endfor
endfor
endfunction
