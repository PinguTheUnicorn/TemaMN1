function [centroids] = new_centroids(points, NC, centroids0)
  [N D] = size(points);
  cluster = zeros(NC, D);
  NPC = zeros(NC, 1);

    for i = 1 : N
    min = inf;
    for j = 1 : NC
      dis = norm(points(i, :) - centroids0(j, :));
      if dis < min
        min = dis;
        min_poz = j;
      endif
    endfor

    NPC(min_poz)++;
    cluster(min_poz, :) += points(i, :);
  endfor

  centroids = cluster ./ NPC;
endfunction
