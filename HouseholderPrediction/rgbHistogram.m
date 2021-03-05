function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  div = 256 / count_bins;
  r_plane = image(:, :, 1);
  g_plane = image(:, :, 2);
  b_plane = image(:, :, 3);

  v = 0 : div : 256;

  r_values = histc(r_plane(:), v)
  g_values = histc(g_plane(:), v)
  b_values = histc(b_plane(:), v)
  sol = [r_values(1 : end - 1)' g_values(1 : end - 1)' b_values(1 : end - 1)'];
end