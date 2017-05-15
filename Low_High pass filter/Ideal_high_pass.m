function y = Ideal_high_pass(ImgData,d)

spectrum = fftshift(fft2(ImgData));
[row col] = size(spectrum);
m = round(row/2);
n = round(col/2);
for i = 1:row
    for j = 1:col
        distance = sqrt((i-m)^2+(j-n)^2);
        if distance<d
            h = 0;
        else
            h = 1;
        end
        spectrum(i,j) = h*spectrum(i,j);
    end
end
Img = uint8(real(ifft2(ifftshift(spectrum ))));
y = Img;