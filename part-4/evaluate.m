function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  ## reading the images from testset
  cats_dir = strcat (path_to_testset, 'cats/');
  cats_img = getImgNames (cats_dir);
  cats_size = size (cats_img,1);
  not_cats_dir = strcat (path_to_testset, 'not_cats/');
  not_cats_img = getImgNames (not_cats_dir);
  images = [cats_img; not_cats_img];
  N = size(images, 1);
  perc = 0;
  if histogram == 'RGB'
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
  else
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
  endif
  [rows,cols] = size (X);
  ## scaling the colums from X
  X = (X(:,1:cols) - mean(X(:,1:cols))) ./ std(X(:,1:cols));
  X(:,end+1) = 1;
  X_tilda = X;
  for i = 1 : N
    ## finding the class
    y(i) = w' * (X_tilda(i,:))';
    if y(i) >= 0
      if  i <= cats_size
        perc = perc + 1;
      endif
    endif
    if y(i) < 0
      if  i > cats_size
        perc = perc + 1;
      endif
    endif
  endfor
  percentage = perc / N; ## finding the accuarcy precentage
endfunction