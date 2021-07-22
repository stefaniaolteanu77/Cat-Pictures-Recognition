function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  ##reading images from testset
  cats_dir = strcat (path_to_testset, 'cats/');
  cats_img = getImgNames(cats_dir);
  cats_size = size(cats_img,1); 
  not_cats_dir = strcat (path_to_testset, 'not_cats/');
  not_cats_img = getImgNames(not_cats_dir);
  images = [cats_img;not_cats_img];
  N = size(images,1);
  perc = 0;
  for i = 1 : N
    x = images(i,:);
    if i <= cats_size
      path_to_image = strcat (cats_dir,x);
    else 
      path_to_image = strcat (not_cats_dir,x);
    endif
    if histogram == 'RGB'
      X = rgbHistogram(path_to_image,count_bins);
      X(end+1) = 1; # adding the bias
    else 
      X = hsvHistogram(path_to_image,count_bins);
      X(end+1) = 1; # adding the bias
    endif
    ## finding the class
    y = w'*X';
    if y >= 0
      if  i <= cats_size
        perc = perc+1;
      endif
    endif
    if y < 0
      if  i > cats_size
        perc = perc+1;
      endif
    endif
  endfor
  percentage = perc/N; # calculating the accuracy percentage
endfunction