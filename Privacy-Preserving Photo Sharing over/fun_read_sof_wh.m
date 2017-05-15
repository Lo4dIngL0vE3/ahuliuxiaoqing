function [height, width] = fun_read_sof_wh(locff,ImgData)
%extract SOF(Start Of Frame), and extract the width of the image

m = find(ImgData(locff+1)==192);
m = m(length(m),1);
n = locff(m,1); %FF mark coordinates
height = ImgData(n+5:n+6, 1);
width = ImgData(n+7:n+8, 1);