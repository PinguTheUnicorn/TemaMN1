function [cost] = compute_cost_pc(points, centroids)
  [N D] = size(points);
  [NC D] = size(centroids);
  cost = 0;

  for i = 1 : N
    min = inf;
    for j = 1 : NC
      dis = norm(points(i, :) - centroids(j, :));
      if dis < min
        min = dis;
      endif
    endfor

    cost += min;
  endfor
endfunction

