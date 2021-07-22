function [sol] = hsvHistogram(path_to_image, count_bins)
  # convertion the image from rgb to hsv
  hsv = myrgb2hsv(path_to_image);
  # constructiong the ranges for the histogram
  binrange = [0:(1.01/count_bins):1.01];
    
  ## histogram for each colour
  hue_array = hsv(:,:,1)(:);
  hue = histc (hue_array, binrange);
  hue(end) = [];
    
  sat_array = hsv(:,:,2)(:);
  sat = histc (sat_array, binrange);
  sat(end) = [];
    
  value_array = hsv(:,:,3)(:);
  value = histc (value_array, binrange);
  value(end) = [];
  # hsv histogram 
  sol = [hue; sat; value]';
endfunction