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

  if histogram == 'HSV'
    for i = 1 : cats_size
      x = images(i,:);
      path_to_image = strcat (cats_dir,x);
      X(i,:) = hsvHistogram (path_to_image,count_bins);
    endfor
    for i = cats_size+1 : N
      x = images(i,:);
      path_to_image = strcat (not_cats_dir,x);
      X(i,:) = hsvHistogram(path_to_image,count_bins);  
    endfor
  else
    for i = 1 : cats_size
      x = images(i,:);
      path_to_image = strcat (cats_dir,x);
      X(i,:) = rgbHistogram (path_to_image,count_bins);
    endfor
    for i = cats_size+1 : N
      x = images(i,:);
      path_to_image = strcat (not_cats_dir,x);
      X(i,:) = rgbHistogram(path_to_image,count_bins);  
    endfor
  endif

  # label array
  y(1:cats_size) = 1;
  y(cats_size+1:N) = -1; 
  y = y';
endfunction
