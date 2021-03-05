function [values, colind, rowptr] = matrix_to_csr(A)
  [n n] = size(A);
  nz = nnz(A);
  values = zeros(1, nz);
  colind = zeros(1, nz);
  rowptr = zeros(1, n);
  p_r = p_vc = 1;

  for i = 1 : n
    for j = 1 : n
      if A(i, j) ~= 0
        values(p_vc) = A(i, j);
        colind(p_vc) = j;
        if p_r == i
          rowptr(p_r) = p_vc;
          p_r++;
        endif
        p_vc++;
      endif
    endfor
  endfor

  rowptr(p_r) = nz + 1;
endfunction