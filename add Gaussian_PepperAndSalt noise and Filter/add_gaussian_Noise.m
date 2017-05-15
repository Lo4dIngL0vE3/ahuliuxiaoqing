function y = add_gaussian_Noise(ImgData,R)
% R是高斯噪声强度
[row,col] = size(ImgData);
Noise = wgn(row,col,R);
for i = 1:row
    for j = 1:col
        ImgData(i,j) = round(ImgData(i,j)+ Noise(i,j));
        if ImgData(i,j)>255
            ImgData(i,j) = 255;
        elseif ImgData(i,j)<0
            ImgData(i,j) = 0;
        end
    end
end

y = uint8(ImgData);