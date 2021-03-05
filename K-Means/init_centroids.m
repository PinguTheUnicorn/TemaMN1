function [centroids0] = init_centroids(points, NC)
  [N D] = size(points);
  cluster = zeros(NC, D);
  NPC = zeros(NC, 1);

  for i = 1 : N
    poz = mod(i, NC);
    if poz == 0
      cluster(NC, :) += points(i, :);
      NPC(NC)++;
    else
      cluster(poz, :) += points(i, :);
      NPC(poz)++;
    endif
  endfor

  centroids0 = cluster ./ NPC;
endfunction
