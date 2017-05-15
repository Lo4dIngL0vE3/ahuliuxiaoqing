function y = Alpha_trimedFliter(ImgData,n,d)
% n是奇数 d是偶数
[row,col] = size(ImgData);
k = n^2;
h = k-d;
f = floor(n/2);
for i =  1+f:row-f
    for j = 1+f:col-f
        Ary = ImgData(i-f:i+f,j-f:j+f);
        Ary = reshape(Ary,[1,k]);
        Ary = sort(Ary);
        Ary = Ary((d/2)+1:k-(d/2));
        m = sum(Ary);
        ImgData(i,j) = round(m/h);
    end
end
y = ImgData;