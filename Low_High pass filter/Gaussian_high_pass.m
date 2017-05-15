function y = Gaussian_high_pass(ImgData,f)
% f «Ωÿ÷¡∆µ¬ 
spectrum = fft2(double(ImgData));
spectrum = fftshift(spectrum);
[row,col] = size(spectrum);

r = fix(row/2);
c = fix(col/2);

for i =  1:row
  for j = 1:col
      distance = sqrt((i-r)^2+(j-c)^2);
      h = 1-exp(-distance*distance/(2*f*f));
      Spe(i,j) = h*spectrum(i,j);
  end
end
Spe = ifftshift(Spe);
spectrum = ifft2(result);

y = uint8(real(spectrum));