function [sol] = rgbHistogram(path_to_image, count_bins)
  ## reading the image
  image = imread (path_to_image);
  ## constructing the ranges for the histogram
  binrange = [0:(256/count_bins):256];
  
  ## histogram for each colour
  red_array = image(:,:,1)(:);
  red = histc(red_array, binrange);
  red(end) = []; # removing the the extra 0 at the end 
  
  green_array = image(:,:,2)(:);
  green = histc (green_array, binrange);
  green(end) = []; # removing the the extra 0 at the end 
   
  blue_array = image(:,:,3)(:);
  blue = histc (blue_array, binrange);
  blue(end) = []; # removing the the extra 0 at the end 
  
  ## rgb histogram 
  sol = [red;green;blue]';
endfunction