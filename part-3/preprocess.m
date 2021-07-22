function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  ## images from cats directory
  cats_dir = strcat (path_to_dataset, 'cats/');
  cats_img = getImgNames (cats_dir);
  cats_size = size (cats_img,1);
  ## images from not_cats directory
  not_cats_dir = strcat (path_to_dataset, 'not_cats/');
  not_cats_img = getImgNames (not_cats_dir);

  images = [cats_img; not_cats_img]; #total images
  N = size (images);
  M = count_bins * 3;

  X = zeros (N,M);
  y = zeros (1,N);

  for i = 1 : N
    x = images(i,:);
    if i <= cats_size
      path_to_image = strcat (cats_dir, x); # path_to_image for cats
      y(i) = 1; # cats images label
    else 
      path_to_image = strcat (not_cats_dir, x); #path_to_image for not_cats 
      y(i) = -1; # not_cats image label
    endif
    ## feature array 
    if histogram == 'RGB'
      X(i,:) = rgbHistogram (path_to_image, count_bins);
    else 
      X(i,:) = hsvHistogram (path_to_image, count_bins);
    endif
  endfor
  # label array
  y = y';
endfunction
