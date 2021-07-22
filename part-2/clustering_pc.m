function [centroids] = clustering_pc(points, NC)
  [rows,col] = size (points);
  ## initializing the centoids and the clusters with 0
  centroids = zeros(NC,col);  
  cluster = zeros(floor(rows/NC),col,NC);
  ## populating the each cluster the the points mod NC = k
  ## calculatinf the mean for each cluster the find its centoid
  for k = 1:NC
    cluster(:,:,k) = points(k:NC:rows,:);
    centroids(k,:) = sum (cluster(:,:,k)) / (floor ((rows - k) / NC) + 1);
  endfor
  true = 1;
  while true == 1
    for i = 1:rows
      init_centroids = centroids; 
      ## calculating the euclidian distannce between each point and each centroid
      for j = 1:NC
        dist(j) = sqrt (sum ((points(i,:) - centroids(j,:)) .^ 2));
      endfor
      ## gettind the index of the minimum distance and creating an array of indices
      [~,idx] = min (dist);
      cluster_idx(i) = idx;
    endfor 
    for i = 1:NC
      ## creating a cluster using the index array
      clusters = points(i == cluster_idx, :);
      num = size (clusters,1);
      ## recaculating centroids 
      if num == 1
        centroids(i,:) = clusters; # for only one point in cluster 
      else
        centroids(i,:) = sum (clusters) / num;
      endif
    endfor
    ## the centroids stop changing
    if (init_centroids == centroids) 
      true = 0;
    endif 
  endwhile
endfunction