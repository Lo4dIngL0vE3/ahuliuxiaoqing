function y = salt_pepper_Noise(ImgData,f1,f2)
% f1,f2 ÊÇ½·¡¢ÑÎ±ÈÀý
[row,col] = size(ImgData);
Num = row*col;
m = round(Num*f1);
x1 = round((row-1)*rand(m,1));
y1 = round((col-1)*rand(m,1));
for i = 1:m
    ImgData(x1(i)+1,y1(i)+1) = 0;
end
n = round(Num*f2);
x2 = round((row-1)*rand(n,1));
y2 = round((col-1)*rand(n,1));
for j = 1:n
    ImgData(x2(j)+1,y2(j)+1) = 255;
end

y = ImgData;