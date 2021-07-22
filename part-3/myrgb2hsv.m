function [hsv] = myrgb2hsv(path_to_image)
  ## read image
  rgb = imread (path_to_image);
  rows = size(rgb,1);
  cols = size(rgb,2);
  # initialising all the matrixes i will need with 0
  hsv = zeros(rows,cols,3);
  H = zeros(rows,cols);
  S =  zeros(rows,cols);
  V = zeros(rows,cols);
  ## getting each component of the image
  R = rgb(:,:,1);
  G = rgb(:,:,2);
  B = rgb (:,:,3);
  
  R_n = double(R) / 255;
  G_n = double(G) / 255;
  B_n = double(B) / 255;
  ## getting the max and min of each element of the components
  C_max1 = max (R_n, G_n);
  C_max = max (C_max1, B_n);
  C_min1 = min (R_n, G_n);
  C_min = min (C_min1, B_n);
  
  delta = C_max-C_min;
  # copy of delta
  aux = delta;
  # changing all the 0 in aux to 1
  aux(aux == 0) = 1;
  ## building the H component
  result1 = C_max == R_n;
  H(result1) = 60 * (mod ((G_n(result1) - B_n(result1)) ./ aux(result1),6));
  result2 = C_max == G_n;
  H(result2) = 60 * ((B_n(result2) - R_n(result2)) ./ aux(result2) + 2);
  result3 = C_max == B_n;
  H(result3) = 60 * ((R_n(result3) - G_n(result3)) ./ aux(result3) + 4);
  H(delta == 0) = 0;
  H = H /360;
  ## building the S component
  result = C_max == S; 
  S(~result) = delta(~result) ./ C_max(~result);
  V = C_max; # V component
  ## hvs image 
  hsv(:,:,1) = H;
  hsv(:,:,2) = S;
  hsv(:,:,3) = V;     
endfunction
