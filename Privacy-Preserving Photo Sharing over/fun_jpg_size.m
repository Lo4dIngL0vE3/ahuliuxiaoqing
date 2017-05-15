function [m,n,blkm,blkn]=fun_jpg_size(ImgData,locff)
%m and n is the size of the picture
%blkm,blkn is how many 8*8 block in picture
b=find(ImgData(locff+1,1)==192);
c=locff(b,1); %255 is tag
m=ImgData((c+5),1)*16*16+ImgData((c+6),1);  %m n is the picture width and higth
n=ImgData((c+7),1)*16*16+ImgData((c+8),1);
blkm=ceil(m/8); 
blkn=ceil(n/8); %Take up the whole
end