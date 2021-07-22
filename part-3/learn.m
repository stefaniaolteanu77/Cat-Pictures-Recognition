function [w] = learn(X, y)
  ## adding the bias
  X(:,end+1) = 1;
  X_tilda = X;
  ## initialising w, R, Q with 0
  w = zeros(size(X_tilda,2),1);
  [rows,cols] = size(X_tilda);
  Q = zeros(rows,rows);
  R = zeros(rows,cols);
  ## using Householder and then SST to find w
  [Q R] = Householder(X_tilda);
  z = Q'*y;
  w = SST(R,z);
end
