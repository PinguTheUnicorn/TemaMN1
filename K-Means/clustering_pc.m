function [centroids] = clustering_pc(points, NC)
  centroids0 = init_centroids(points, NC);
  centroids = new_centroids(points, NC, centroids0);

  while ~isequal(centroids, centroids0)
    centroids0 = centroids;
    centroids = new_centroids(points, NC, centroids0);
  endwhile
endfunction