function [A, b] = generate_probabilities_system(rows)
  p = (rows * (rows + 1)) / 2;
  A = zeros(p);
  b = zeros(p, 1);
  b(p - rows + 1 : p, :) = 1;
  
  A(1, 1) = 4;
  A(1, 3) = A(3, 1) = -1;

  idx0 = 1;
  idx = 2;
  r = 1;
  while idx < p - rows
    r++;
    A(idx, idx) = 5;
    v = idx0 : r : idx0 + 2 * r + 1;
    A(idx, v) = A(v, idx) = -1;
    idx0 = idx;
    idx = idx + r;
  endwhile

  idx0 = 3;
  idx = 5;
  r = 4;
  while idx0 < p
    A(idx0, idx0) = 5;
    v = idx : idx + 1;
    A(idx0, v) = A(v, idx0) = -1;
    idx0 = idx + 1;
    idx = idx + r;
    r++;
  endwhile

  idx0 = 5;
  r = 3;
  while idx0 < p - rows + 2
    for idx = idx0 : idx0 + r - 3
      A(idx, idx) = 6;
      A(idx, idx + 1) = -1;
      A(idx + 1, idx) = -1;
      v = [idx + r, idx + r + 1];
      A(idx, v) = -1;
      A(v, idx) = -1;
    endfor
    idx0 = idx0 + r;
    r++;
  endwhile

  idx = p - rows + 1;
  A(idx, idx) = 4;
  v = [idx + 1 idx - rows + 1];
  A(idx, v) = A(v, idx) = -1;

  for idx = p - rows + 2 : p - 1
    A(idx, idx) = 5;
    A(idx, idx + 1) = A(idx + 1, idx) = -1;
  endfor

  A(p, p) = 4;
endfunction