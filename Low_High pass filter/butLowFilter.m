function y = butLowFilter(ImgData,f,n)
% f是截至频率Hz，n是阶数
spectrum = fftshift(fft2(ImgData));
[row col] = size(spectrum);
m = round(row/2);
n = round(col/2);
for i = 1:row
    for j = 1:col
        distance = sqrt((i-m)^2+(j-n)^2);
        h = 1/(1+(f/distance)^(2*n));
        spectrum(i,j) = h*spectrum(i,j);
    end
end
Img = uint8(real(ifft2(ifftshift(spectrum ))));
y = Img;