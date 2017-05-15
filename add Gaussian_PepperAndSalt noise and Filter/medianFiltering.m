function y = medianFiltering(ImgData,n)
% nÊÇÆæÊý
k = n^2;
[row,col] = size(ImgData);
f = floor(n/2);
for i =  1+f:row-f
    for j = 1+f:col-f
        Ary = ImgData(i-f:i+f,j-f:j+f);
        Ary = reshape(Ary,[1,k]);
        Ary = sort(Ary);
        ImgData(i,j) = Ary(ceil(k/2));
    end
end
y = ImgData;