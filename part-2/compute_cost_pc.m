function [cost] = compute_cost_pc(points, centroids)
  [rows,col] = size(points);
  cost = 0;  
  NC = size (centroids, 1);
  for i = 1:rows
    ## calculating the euclidian distance from each point to each centroid
    for j=1:NC
        dist(j) = sqrt (sum ((points(i,:) - centroids(j,:)) .^ 2));
    endfor
    # adding to the cost the minimum distance
    dist_min = min (dist); 
    cost = cost + dist_min;
  endfor
endfunction

